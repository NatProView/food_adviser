import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:rxdart/rxdart.dart';

part 'drift_database.g.dart';

class Dish extends Table {
  //autoIncrement automatycznie ustawia id jako primary key
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  //jesli nie bedzie dzialac mozna check i nawyzej sprawdzic poprawne zastosowanie
  IntColumn get calories =>
      integer().check(calories.isBiggerThan(0 as Expression<int>))();

  IntColumn get timeToPrepare =>
      integer().check(timeToPrepare.isBetweenValues(1, 300))();
}

class Tag extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();
}

class Ingredient extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  IntColumn get calories => integer()();
}

class DishTag extends Table {
  IntColumn get dishId => integer().references(Dish, #id)();

  IntColumn get tagId => integer().references(Tag, #id)();
}

class DishIngredient extends Table {
  IntColumn get dishId => integer().references(Dish, #id)();

  IntColumn get ingredientId => integer().references(Ingredient, #id)();
}

class FullDish extends Table {
  final DishData dish;
  final List<TagData> tags;
  final List<IngredientData> ingredients;

  FullDish(this.dish, this.tags, this.ingredients);
}

@DriftDatabase(
    tables: [Dish, Tag, Ingredient, DishTag, DishIngredient], daos: [DishDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(SqfliteQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [Dish, Tag, Ingredient, DishTag, DishIngredient])
class DishDao extends DatabaseAccessor<AppDatabase> with _$DishDaoMixin {
  DishDao(AppDatabase db) : super(db);


  Stream<FullDish> watchDish(int id) {
    final dishQuery = select(dish)..where((entry) => entry.id.equals(id));

    final tagsQuery = select(dishTag).join(
      [
        innerJoin(
          tag,
          tag.id.equalsExp(dishTag.tagId),
        ),
      ],
    )..where(dishTag.dishId.equals(id));

    final ingredientsQuery = select(dishIngredient).join(
      [
        innerJoin(
          ingredient,
          ingredient.id.equalsExp(dishIngredient.ingredientId),
        ),
      ],
    )..where(dishIngredient.dishId.equals(id));

    final dishStream = dishQuery.watchSingle();

    final tagsStream = tagsQuery.watch().map((rows) {
      return rows.map((row) => row.readTable(tag)).toList();
    });

    final ingredientsStream = ingredientsQuery.watch().map((rows) {
      return rows.map((row) => row.readTable(ingredient)).toList();
    });

    return Rx.combineLatest3(dishStream, tagsStream, ingredientsStream,
        (DishData dishData, List<TagData> tagData,
            List<IngredientData> ingredientData) {
      return FullDish(dishData, tagData, ingredientData);
    });
  }


  Stream<List<DishData>> searchByConditions(
      List<int> tagIds, List<int> ingredientIds, String stringBar) {
    final resultQuery = select(dish).join(
      [
        innerJoin(dishTag, dishTag.dishId.equalsExp(dish.id)),
        innerJoin(dishIngredient, dishIngredient.dishId.equalsExp(dish.id)),
      ],
    )..where(
         tagIds.isNotEmpty ? dishTag.tagId.isIn(tagIds) : dish.id.equalsExp(dish.id) &
         (ingredientIds.isNotEmpty ? dishIngredient.ingredientId.isIn(ingredientIds) : dish.id.equalsExp(dish.id))
         & (stringBar.isNotEmpty ? dish.name.contains(stringBar) : dish.id.equalsExp(dish.id) ));

    return resultQuery.map((row) => row.readTable(dish)).watch();
  }

  Future<List<DishData>> getAllDishes() => select(dish).get();

  //metoda zwracaja nazwy tagow dla UI
  Future<List> getTagNames() => select(tag.name as ResultSetImplementation<HasResultSet, dynamic>).get();

  Stream<List<DishData>> watchAllDishes() => select(dish).watch();


  Future<void> insertDish(FullDish entry) {
    return transaction(() async {
      final newDish = entry.dish;
      await into(dish).insert(newDish, mode: InsertMode.replace);

      await (delete(dishTag)..where((entry) => entry.dishId.equals(newDish.id)))
          .go();

      await (delete(dishIngredient)
            ..where((entry) => entry.dishId.equals(newDish.id)))
          .go();

      for (final tag in entry.tags) {
        await into(dishTag)
            .insert(DishTagData(dishId: newDish.id, tagId: tag.id));
      }
      for (final ingredient in entry.ingredients) {
        await into(dishIngredient).insert(DishIngredientData(
            dishId: newDish.id, ingredientId: ingredient.id));
      }
    });
  }

  Future<void> updateDish(FullDish entry, int dishToUpdateId) {
    return transaction(() async {
      await (update(dish)..where((d) => d.id.equals(dishToUpdateId))).write(
        DishCompanion(
          name: Value(entry.dish.name),
          timeToPrepare: Value(entry.dish.timeToPrepare),
        ),
      );

      await (delete(dishTag)..where((d) => d.dishId.equals(dishToUpdateId)))
          .go();

      await (delete(dishIngredient)
            ..where((d) => d.dishId.equals(dishToUpdateId)))
          .go();

      for (final tag in entry.tags) {
        await into(dishTag)
            .insert(DishTagData(dishId: dishToUpdateId, tagId: tag.id));
      }
      for (final ingredient in entry.ingredients) {
        await into(dishIngredient).insert(DishIngredientData(
            dishId: dishToUpdateId, ingredientId: ingredient.id));
      }
    });
  }

  Future<void> deleteDish(int dishToDeleteId) {
    return transaction(() async {
      await (delete(dish)..where((d) => d.id.equals(dishToDeleteId))).go();

      await (delete(dishTag)..where((d) => d.dishId.equals(dishToDeleteId)))
          .go();

      await (delete(dishIngredient)
            ..where((d) => d.dishId.equals(dishToDeleteId)))
          .go();
    });
  }
}
