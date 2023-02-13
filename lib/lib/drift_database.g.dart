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
  static const VerificationMeta _timeToPrepareMeta =
      const VerificationMeta('timeToPrepare');
  @override
  late final GeneratedColumn<int> timeToPrepare = GeneratedColumn<int>(
      'time_to_prepare', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, calories, timeToPrepare];
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
    if (data.containsKey('time_to_prepare')) {
      context.handle(
          _timeToPrepareMeta,
          timeToPrepare.isAcceptableOrUnknown(
              data['time_to_prepare']!, _timeToPrepareMeta));
    } else if (isInserting) {
      context.missing(_timeToPrepareMeta);
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
      timeToPrepare: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_to_prepare'])!,
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
  final int timeToPrepare;
  const DishData(
      {required this.id,
      required this.name,
      required this.calories,
      required this.timeToPrepare});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['calories'] = Variable<int>(calories);
    map['time_to_prepare'] = Variable<int>(timeToPrepare);
    return map;
  }

  DishCompanion toCompanion(bool nullToAbsent) {
    return DishCompanion(
      id: Value(id),
      name: Value(name),
      calories: Value(calories),
      timeToPrepare: Value(timeToPrepare),
    );
  }

  factory DishData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DishData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      calories: serializer.fromJson<int>(json['calories']),
      timeToPrepare: serializer.fromJson<int>(json['timeToPrepare']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'calories': serializer.toJson<int>(calories),
      'timeToPrepare': serializer.toJson<int>(timeToPrepare),
    };
  }

  DishData copyWith(
          {int? id, String? name, int? calories, int? timeToPrepare}) =>
      DishData(
        id: id ?? this.id,
        name: name ?? this.name,
        calories: calories ?? this.calories,
        timeToPrepare: timeToPrepare ?? this.timeToPrepare,
      );
  @override
  String toString() {
    return (StringBuffer('DishData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('timeToPrepare: $timeToPrepare')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, calories, timeToPrepare);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DishData &&
          other.id == this.id &&
          other.name == this.name &&
          other.calories == this.calories &&
          other.timeToPrepare == this.timeToPrepare);
}

class DishCompanion extends UpdateCompanion<DishData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> calories;
  final Value<int> timeToPrepare;
  const DishCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.calories = const Value.absent(),
    this.timeToPrepare = const Value.absent(),
  });
  DishCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int calories,
    required int timeToPrepare,
  })  : name = Value(name),
        calories = Value(calories),
        timeToPrepare = Value(timeToPrepare);
  static Insertable<DishData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? calories,
    Expression<int>? timeToPrepare,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (calories != null) 'calories': calories,
      if (timeToPrepare != null) 'time_to_prepare': timeToPrepare,
    });
  }

  DishCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? calories,
      Value<int>? timeToPrepare}) {
    return DishCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      timeToPrepare: timeToPrepare ?? this.timeToPrepare,
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
    if (timeToPrepare.present) {
      map['time_to_prepare'] = Variable<int>(timeToPrepare.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DishCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('timeToPrepare: $timeToPrepare')
          ..write(')'))
        .toString();
  }
}

class $TagTable extends Tag with TableInfo<$TagTable, TagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'tag';
  @override
  String get actualTableName => 'tag';
  @override
  VerificationContext validateIntegrity(Insertable<TagData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $TagTable createAlias(String alias) {
    return $TagTable(attachedDatabase, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final int id;
  final String name;
  const TagData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TagCompanion toCompanion(bool nullToAbsent) {
    return TagCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory TagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TagData copyWith({int? id, String? name}) => TagData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagData && other.id == this.id && other.name == this.name);
}

class TagCompanion extends UpdateCompanion<TagData> {
  final Value<int> id;
  final Value<String> name;
  const TagCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<TagData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TagCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TagCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $IngredientTable extends Ingredient
    with TableInfo<$IngredientTable, IngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientTable(this.attachedDatabase, [this._alias]);
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
  String get aliasedName => _alias ?? 'ingredient';
  @override
  String get actualTableName => 'ingredient';
  @override
  VerificationContext validateIntegrity(Insertable<IngredientData> instance,
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
  IngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      calories: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calories'])!,
    );
  }

  @override
  $IngredientTable createAlias(String alias) {
    return $IngredientTable(attachedDatabase, alias);
  }
}

class IngredientData extends DataClass implements Insertable<IngredientData> {
  final int id;
  final String name;
  final int calories;
  const IngredientData(
      {required this.id, required this.name, required this.calories});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['calories'] = Variable<int>(calories);
    return map;
  }

  IngredientCompanion toCompanion(bool nullToAbsent) {
    return IngredientCompanion(
      id: Value(id),
      name: Value(name),
      calories: Value(calories),
    );
  }

  factory IngredientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientData(
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

  IngredientData copyWith({int? id, String? name, int? calories}) =>
      IngredientData(
        id: id ?? this.id,
        name: name ?? this.name,
        calories: calories ?? this.calories,
      );
  @override
  String toString() {
    return (StringBuffer('IngredientData(')
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
      (other is IngredientData &&
          other.id == this.id &&
          other.name == this.name &&
          other.calories == this.calories);
}

class IngredientCompanion extends UpdateCompanion<IngredientData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> calories;
  const IngredientCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.calories = const Value.absent(),
  });
  IngredientCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int calories,
  })  : name = Value(name),
        calories = Value(calories);
  static Insertable<IngredientData> custom({
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

  IngredientCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? calories}) {
    return IngredientCompanion(
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
    return (StringBuffer('IngredientCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }
}

class $DishTagTable extends DishTag with TableInfo<$DishTagTable, DishTagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DishTagTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dishIdMeta = const VerificationMeta('dishId');
  @override
  late final GeneratedColumn<int> dishId = GeneratedColumn<int>(
      'dish_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES dish (id)'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag (id)'));
  @override
  List<GeneratedColumn> get $columns => [dishId, tagId];
  @override
  String get aliasedName => _alias ?? 'dish_tag';
  @override
  String get actualTableName => 'dish_tag';
  @override
  VerificationContext validateIntegrity(Insertable<DishTagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dish_id')) {
      context.handle(_dishIdMeta,
          dishId.isAcceptableOrUnknown(data['dish_id']!, _dishIdMeta));
    } else if (isInserting) {
      context.missing(_dishIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DishTagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DishTagData(
      dishId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dish_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $DishTagTable createAlias(String alias) {
    return $DishTagTable(attachedDatabase, alias);
  }
}

class DishTagData extends DataClass implements Insertable<DishTagData> {
  final int dishId;
  final int tagId;
  const DishTagData({required this.dishId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dish_id'] = Variable<int>(dishId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  DishTagCompanion toCompanion(bool nullToAbsent) {
    return DishTagCompanion(
      dishId: Value(dishId),
      tagId: Value(tagId),
    );
  }

  factory DishTagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DishTagData(
      dishId: serializer.fromJson<int>(json['dishId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dishId': serializer.toJson<int>(dishId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  DishTagData copyWith({int? dishId, int? tagId}) => DishTagData(
        dishId: dishId ?? this.dishId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('DishTagData(')
          ..write('dishId: $dishId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dishId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DishTagData &&
          other.dishId == this.dishId &&
          other.tagId == this.tagId);
}

class DishTagCompanion extends UpdateCompanion<DishTagData> {
  final Value<int> dishId;
  final Value<int> tagId;
  const DishTagCompanion({
    this.dishId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  DishTagCompanion.insert({
    required int dishId,
    required int tagId,
  })  : dishId = Value(dishId),
        tagId = Value(tagId);
  static Insertable<DishTagData> custom({
    Expression<int>? dishId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (dishId != null) 'dish_id': dishId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  DishTagCompanion copyWith({Value<int>? dishId, Value<int>? tagId}) {
    return DishTagCompanion(
      dishId: dishId ?? this.dishId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dishId.present) {
      map['dish_id'] = Variable<int>(dishId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DishTagCompanion(')
          ..write('dishId: $dishId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $DishIngredientTable extends DishIngredient
    with TableInfo<$DishIngredientTable, DishIngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DishIngredientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dishIdMeta = const VerificationMeta('dishId');
  @override
  late final GeneratedColumn<int> dishId = GeneratedColumn<int>(
      'dish_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES dish (id)'));
  static const VerificationMeta _ingredientIdMeta =
      const VerificationMeta('ingredientId');
  @override
  late final GeneratedColumn<int> ingredientId = GeneratedColumn<int>(
      'ingredient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES ingredient (id)'));
  @override
  List<GeneratedColumn> get $columns => [dishId, ingredientId];
  @override
  String get aliasedName => _alias ?? 'dish_ingredient';
  @override
  String get actualTableName => 'dish_ingredient';
  @override
  VerificationContext validateIntegrity(Insertable<DishIngredientData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dish_id')) {
      context.handle(_dishIdMeta,
          dishId.isAcceptableOrUnknown(data['dish_id']!, _dishIdMeta));
    } else if (isInserting) {
      context.missing(_dishIdMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
          _ingredientIdMeta,
          ingredientId.isAcceptableOrUnknown(
              data['ingredient_id']!, _ingredientIdMeta));
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DishIngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DishIngredientData(
      dishId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dish_id'])!,
      ingredientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ingredient_id'])!,
    );
  }

  @override
  $DishIngredientTable createAlias(String alias) {
    return $DishIngredientTable(attachedDatabase, alias);
  }
}

class DishIngredientData extends DataClass
    implements Insertable<DishIngredientData> {
  final int dishId;
  final int ingredientId;
  const DishIngredientData({required this.dishId, required this.ingredientId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dish_id'] = Variable<int>(dishId);
    map['ingredient_id'] = Variable<int>(ingredientId);
    return map;
  }

  DishIngredientCompanion toCompanion(bool nullToAbsent) {
    return DishIngredientCompanion(
      dishId: Value(dishId),
      ingredientId: Value(ingredientId),
    );
  }

  factory DishIngredientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DishIngredientData(
      dishId: serializer.fromJson<int>(json['dishId']),
      ingredientId: serializer.fromJson<int>(json['ingredientId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dishId': serializer.toJson<int>(dishId),
      'ingredientId': serializer.toJson<int>(ingredientId),
    };
  }

  DishIngredientData copyWith({int? dishId, int? ingredientId}) =>
      DishIngredientData(
        dishId: dishId ?? this.dishId,
        ingredientId: ingredientId ?? this.ingredientId,
      );
  @override
  String toString() {
    return (StringBuffer('DishIngredientData(')
          ..write('dishId: $dishId, ')
          ..write('ingredientId: $ingredientId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dishId, ingredientId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DishIngredientData &&
          other.dishId == this.dishId &&
          other.ingredientId == this.ingredientId);
}

class DishIngredientCompanion extends UpdateCompanion<DishIngredientData> {
  final Value<int> dishId;
  final Value<int> ingredientId;
  const DishIngredientCompanion({
    this.dishId = const Value.absent(),
    this.ingredientId = const Value.absent(),
  });
  DishIngredientCompanion.insert({
    required int dishId,
    required int ingredientId,
  })  : dishId = Value(dishId),
        ingredientId = Value(ingredientId);
  static Insertable<DishIngredientData> custom({
    Expression<int>? dishId,
    Expression<int>? ingredientId,
  }) {
    return RawValuesInsertable({
      if (dishId != null) 'dish_id': dishId,
      if (ingredientId != null) 'ingredient_id': ingredientId,
    });
  }

  DishIngredientCompanion copyWith(
      {Value<int>? dishId, Value<int>? ingredientId}) {
    return DishIngredientCompanion(
      dishId: dishId ?? this.dishId,
      ingredientId: ingredientId ?? this.ingredientId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dishId.present) {
      map['dish_id'] = Variable<int>(dishId.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<int>(ingredientId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DishIngredientCompanion(')
          ..write('dishId: $dishId, ')
          ..write('ingredientId: $ingredientId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $DishTable dish = $DishTable(this);
  late final $TagTable tag = $TagTable(this);
  late final $IngredientTable ingredient = $IngredientTable(this);
  late final $DishTagTable dishTag = $DishTagTable(this);
  late final $DishIngredientTable dishIngredient = $DishIngredientTable(this);
  late final DishDao dishDao = DishDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dish, tag, ingredient, dishTag, dishIngredient];
}

mixin _$DishDaoMixin on DatabaseAccessor<AppDatabase> {
  $DishTable get dish => attachedDatabase.dish;
  $TagTable get tag => attachedDatabase.tag;
  $IngredientTable get ingredient => attachedDatabase.ingredient;
  $DishTagTable get dishTag => attachedDatabase.dishTag;
  $DishIngredientTable get dishIngredient => attachedDatabase.dishIngredient;
}
