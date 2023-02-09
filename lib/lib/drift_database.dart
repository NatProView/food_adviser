import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

part 'drift_database.g.dart';

class Dish extends Table {
  //autoIncrement automatycznie ustawia id jako primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get calories => integer()();
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



@DriftDatabase(tables: [Dish], daos: [DishDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(): super(SqfliteQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [Dish, Tag])
class DishDao extends DatabaseAccessor<AppDatabase> with _$DishDaoMixin {
  DishDao(AppDatabase db) : super(db);

  Future<List<DishData>> getAllDishes() => select(dish).get();
  Stream<List<DishData>> watchAllDishes() => select(dish).watch();
  Future insertDish(Insertable<DishData> newDish) => into(dish).insert(newDish);
  Future updateDish(Insertable<DishData> newDish) => update(dish).replace(newDish);
  Future deleteDish(Insertable<DishData> newDish) => delete(dish).delete(newDish);
}