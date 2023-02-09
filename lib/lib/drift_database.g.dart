// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $DishTable extends Dish with TableInfo<$DishTable, DishData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DishTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _caloriesMeta =
      const VerificationMeta('calories');
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
      'calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, calories];
  @override
  String get aliasedName => _alias ?? 'dish';
  @override
  String get actualTableName => 'dish';
  @override
  VerificationContext validateIntegrity(Insertable<DishData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DishData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DishData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories'])!,
    );
  }

  @override
  $DishTable createAlias(String alias) {
    return $DishTable(attachedDatabase, alias);
  }
}

class DishData extends DataClass implements Insertable<DishData> {
  final int id;
  final String name;
  final int calories;
  const DishData(
      {required this.id, required this.name, required this.calories});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['calories'] = Variable<int>(calories);
    return map;
  }

  DishCompanion toCompanion(bool nullToAbsent) {
    return DishCompanion(
      id: Value(id),
      name: Value(name),
      calories: Value(calories),
    );
  }

  factory DishData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DishData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      calories: serializer.fromJson<int>(json['calories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'calories': serializer.toJson<int>(calories),
    };
  }

  DishData copyWith({int? id, String? name, int? calories}) => DishData(
        id: id ?? this.id,
        name: name ?? this.name,
        calories: calories ?? this.calories,
      );
  @override
  String toString() {
    return (StringBuffer('DishData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, calories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DishData &&
          other.id == this.id &&
          other.name == this.name &&
          other.calories == this.calories);
}

class DishCompanion extends UpdateCompanion<DishData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> calories;
  const DishCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.calories = const Value.absent(),
  });
  DishCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int calories,
  })  : name = Value(name),
        calories = Value(calories);
  static Insertable<DishData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? calories,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (calories != null) 'calories': calories,
    });
  }

  DishCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? calories}) {
    return DishCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DishCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $DishTable dish = $DishTable(this);
  late final DishDao dishDao = DishDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dish];
}

mixin _$DishDaoMixin on DatabaseAccessor<AppDatabase> {
  $DishTable get dish => attachedDatabase.dish;
}
