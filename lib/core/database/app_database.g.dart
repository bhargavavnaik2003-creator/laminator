// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LaminatesTableTable extends LaminatesTable
    with TableInfo<$LaminatesTableTable, LaminatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LaminatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _texturePathMeta =
      const VerificationMeta('texturePath');
  @override
  late final GeneratedColumn<String> texturePath = GeneratedColumn<String>(
      'texture_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _finishTypeMeta =
      const VerificationMeta('finishType');
  @override
  late final GeneratedColumn<String> finishType = GeneratedColumn<String>(
      'finish_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorPrimaryMeta =
      const VerificationMeta('colorPrimary');
  @override
  late final GeneratedColumn<String> colorPrimary = GeneratedColumn<String>(
      'color_primary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _catalogueIdMeta =
      const VerificationMeta('catalogueId');
  @override
  late final GeneratedColumn<int> catalogueId = GeneratedColumn<int>(
      'catalogue_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _patternCategoryMeta =
      const VerificationMeta('patternCategory');
  @override
  late final GeneratedColumn<String> patternCategory = GeneratedColumn<String>(
      'pattern_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        name,
        texturePath,
        finishType,
        colorPrimary,
        catalogueId,
        patternCategory
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'laminates_table';
  @override
  VerificationContext validateIntegrity(Insertable<LaminatesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('texture_path')) {
      context.handle(
          _texturePathMeta,
          texturePath.isAcceptableOrUnknown(
              data['texture_path']!, _texturePathMeta));
    } else if (isInserting) {
      context.missing(_texturePathMeta);
    }
    if (data.containsKey('finish_type')) {
      context.handle(
          _finishTypeMeta,
          finishType.isAcceptableOrUnknown(
              data['finish_type']!, _finishTypeMeta));
    } else if (isInserting) {
      context.missing(_finishTypeMeta);
    }
    if (data.containsKey('color_primary')) {
      context.handle(
          _colorPrimaryMeta,
          colorPrimary.isAcceptableOrUnknown(
              data['color_primary']!, _colorPrimaryMeta));
    } else if (isInserting) {
      context.missing(_colorPrimaryMeta);
    }
    if (data.containsKey('catalogue_id')) {
      context.handle(
          _catalogueIdMeta,
          catalogueId.isAcceptableOrUnknown(
              data['catalogue_id']!, _catalogueIdMeta));
    } else if (isInserting) {
      context.missing(_catalogueIdMeta);
    }
    if (data.containsKey('pattern_category')) {
      context.handle(
          _patternCategoryMeta,
          patternCategory.isAcceptableOrUnknown(
              data['pattern_category']!, _patternCategoryMeta));
    } else if (isInserting) {
      context.missing(_patternCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LaminatesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LaminatesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      texturePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}texture_path'])!,
      finishType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}finish_type'])!,
      colorPrimary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_primary'])!,
      catalogueId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}catalogue_id'])!,
      patternCategory: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}pattern_category'])!,
    );
  }

  @override
  $LaminatesTableTable createAlias(String alias) {
    return $LaminatesTableTable(attachedDatabase, alias);
  }
}

class LaminatesTableData extends DataClass
    implements Insertable<LaminatesTableData> {
  final int id;
  final String code;
  final String name;
  final String texturePath;
  final String finishType;
  final String colorPrimary;
  final int catalogueId;
  final String patternCategory;
  const LaminatesTableData(
      {required this.id,
      required this.code,
      required this.name,
      required this.texturePath,
      required this.finishType,
      required this.colorPrimary,
      required this.catalogueId,
      required this.patternCategory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['texture_path'] = Variable<String>(texturePath);
    map['finish_type'] = Variable<String>(finishType);
    map['color_primary'] = Variable<String>(colorPrimary);
    map['catalogue_id'] = Variable<int>(catalogueId);
    map['pattern_category'] = Variable<String>(patternCategory);
    return map;
  }

  LaminatesTableCompanion toCompanion(bool nullToAbsent) {
    return LaminatesTableCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      texturePath: Value(texturePath),
      finishType: Value(finishType),
      colorPrimary: Value(colorPrimary),
      catalogueId: Value(catalogueId),
      patternCategory: Value(patternCategory),
    );
  }

  factory LaminatesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LaminatesTableData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      texturePath: serializer.fromJson<String>(json['texturePath']),
      finishType: serializer.fromJson<String>(json['finishType']),
      colorPrimary: serializer.fromJson<String>(json['colorPrimary']),
      catalogueId: serializer.fromJson<int>(json['catalogueId']),
      patternCategory: serializer.fromJson<String>(json['patternCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'texturePath': serializer.toJson<String>(texturePath),
      'finishType': serializer.toJson<String>(finishType),
      'colorPrimary': serializer.toJson<String>(colorPrimary),
      'catalogueId': serializer.toJson<int>(catalogueId),
      'patternCategory': serializer.toJson<String>(patternCategory),
    };
  }

  LaminatesTableData copyWith(
          {int? id,
          String? code,
          String? name,
          String? texturePath,
          String? finishType,
          String? colorPrimary,
          int? catalogueId,
          String? patternCategory}) =>
      LaminatesTableData(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        texturePath: texturePath ?? this.texturePath,
        finishType: finishType ?? this.finishType,
        colorPrimary: colorPrimary ?? this.colorPrimary,
        catalogueId: catalogueId ?? this.catalogueId,
        patternCategory: patternCategory ?? this.patternCategory,
      );
  LaminatesTableData copyWithCompanion(LaminatesTableCompanion data) {
    return LaminatesTableData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      texturePath:
          data.texturePath.present ? data.texturePath.value : this.texturePath,
      finishType:
          data.finishType.present ? data.finishType.value : this.finishType,
      colorPrimary: data.colorPrimary.present
          ? data.colorPrimary.value
          : this.colorPrimary,
      catalogueId:
          data.catalogueId.present ? data.catalogueId.value : this.catalogueId,
      patternCategory: data.patternCategory.present
          ? data.patternCategory.value
          : this.patternCategory,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LaminatesTableData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('texturePath: $texturePath, ')
          ..write('finishType: $finishType, ')
          ..write('colorPrimary: $colorPrimary, ')
          ..write('catalogueId: $catalogueId, ')
          ..write('patternCategory: $patternCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, texturePath, finishType,
      colorPrimary, catalogueId, patternCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LaminatesTableData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.texturePath == this.texturePath &&
          other.finishType == this.finishType &&
          other.colorPrimary == this.colorPrimary &&
          other.catalogueId == this.catalogueId &&
          other.patternCategory == this.patternCategory);
}

class LaminatesTableCompanion extends UpdateCompanion<LaminatesTableData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> texturePath;
  final Value<String> finishType;
  final Value<String> colorPrimary;
  final Value<int> catalogueId;
  final Value<String> patternCategory;
  const LaminatesTableCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.texturePath = const Value.absent(),
    this.finishType = const Value.absent(),
    this.colorPrimary = const Value.absent(),
    this.catalogueId = const Value.absent(),
    this.patternCategory = const Value.absent(),
  });
  LaminatesTableCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String texturePath,
    required String finishType,
    required String colorPrimary,
    required int catalogueId,
    required String patternCategory,
  })  : code = Value(code),
        name = Value(name),
        texturePath = Value(texturePath),
        finishType = Value(finishType),
        colorPrimary = Value(colorPrimary),
        catalogueId = Value(catalogueId),
        patternCategory = Value(patternCategory);
  static Insertable<LaminatesTableData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? texturePath,
    Expression<String>? finishType,
    Expression<String>? colorPrimary,
    Expression<int>? catalogueId,
    Expression<String>? patternCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (texturePath != null) 'texture_path': texturePath,
      if (finishType != null) 'finish_type': finishType,
      if (colorPrimary != null) 'color_primary': colorPrimary,
      if (catalogueId != null) 'catalogue_id': catalogueId,
      if (patternCategory != null) 'pattern_category': patternCategory,
    });
  }

  LaminatesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<String>? name,
      Value<String>? texturePath,
      Value<String>? finishType,
      Value<String>? colorPrimary,
      Value<int>? catalogueId,
      Value<String>? patternCategory}) {
    return LaminatesTableCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      texturePath: texturePath ?? this.texturePath,
      finishType: finishType ?? this.finishType,
      colorPrimary: colorPrimary ?? this.colorPrimary,
      catalogueId: catalogueId ?? this.catalogueId,
      patternCategory: patternCategory ?? this.patternCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (texturePath.present) {
      map['texture_path'] = Variable<String>(texturePath.value);
    }
    if (finishType.present) {
      map['finish_type'] = Variable<String>(finishType.value);
    }
    if (colorPrimary.present) {
      map['color_primary'] = Variable<String>(colorPrimary.value);
    }
    if (catalogueId.present) {
      map['catalogue_id'] = Variable<int>(catalogueId.value);
    }
    if (patternCategory.present) {
      map['pattern_category'] = Variable<String>(patternCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LaminatesTableCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('texturePath: $texturePath, ')
          ..write('finishType: $finishType, ')
          ..write('colorPrimary: $colorPrimary, ')
          ..write('catalogueId: $catalogueId, ')
          ..write('patternCategory: $patternCategory')
          ..write(')'))
        .toString();
  }
}

class $RoomsTableTable extends RoomsTable
    with TableInfo<$RoomsTableTable, RoomsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, category, imagePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rooms_table';
  @override
  VerificationContext validateIntegrity(Insertable<RoomsTableData> instance,
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
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path'])!,
    );
  }

  @override
  $RoomsTableTable createAlias(String alias) {
    return $RoomsTableTable(attachedDatabase, alias);
  }
}

class RoomsTableData extends DataClass implements Insertable<RoomsTableData> {
  final int id;
  final String name;
  final String category;
  final String imagePath;
  const RoomsTableData(
      {required this.id,
      required this.name,
      required this.category,
      required this.imagePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['image_path'] = Variable<String>(imagePath);
    return map;
  }

  RoomsTableCompanion toCompanion(bool nullToAbsent) {
    return RoomsTableCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      imagePath: Value(imagePath),
    );
  }

  factory RoomsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'imagePath': serializer.toJson<String>(imagePath),
    };
  }

  RoomsTableData copyWith(
          {int? id, String? name, String? category, String? imagePath}) =>
      RoomsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        imagePath: imagePath ?? this.imagePath,
      );
  RoomsTableData copyWithCompanion(RoomsTableCompanion data) {
    return RoomsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, category, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.imagePath == this.imagePath);
}

class RoomsTableCompanion extends UpdateCompanion<RoomsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> imagePath;
  const RoomsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  RoomsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    required String imagePath,
  })  : name = Value(name),
        category = Value(category),
        imagePath = Value(imagePath);
  static Insertable<RoomsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  RoomsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? category,
      Value<String>? imagePath}) {
    return RoomsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      imagePath: imagePath ?? this.imagePath,
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

class $RoomSurfacesTableTable extends RoomSurfacesTable
    with TableInfo<$RoomSurfacesTableTable, RoomSurfacesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomSurfacesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int> roomId = GeneratedColumn<int>(
      'room_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES rooms_table (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _maskPathMeta =
      const VerificationMeta('maskPath');
  @override
  late final GeneratedColumn<String> maskPath = GeneratedColumn<String>(
      'mask_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, roomId, name, maskPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_surfaces_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RoomSurfacesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('mask_path')) {
      context.handle(_maskPathMeta,
          maskPath.isAcceptableOrUnknown(data['mask_path']!, _maskPathMeta));
    } else if (isInserting) {
      context.missing(_maskPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomSurfacesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomSurfacesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      maskPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mask_path'])!,
    );
  }

  @override
  $RoomSurfacesTableTable createAlias(String alias) {
    return $RoomSurfacesTableTable(attachedDatabase, alias);
  }
}

class RoomSurfacesTableData extends DataClass
    implements Insertable<RoomSurfacesTableData> {
  final int id;
  final int roomId;
  final String name;
  final String maskPath;
  const RoomSurfacesTableData(
      {required this.id,
      required this.roomId,
      required this.name,
      required this.maskPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_id'] = Variable<int>(roomId);
    map['name'] = Variable<String>(name);
    map['mask_path'] = Variable<String>(maskPath);
    return map;
  }

  RoomSurfacesTableCompanion toCompanion(bool nullToAbsent) {
    return RoomSurfacesTableCompanion(
      id: Value(id),
      roomId: Value(roomId),
      name: Value(name),
      maskPath: Value(maskPath),
    );
  }

  factory RoomSurfacesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomSurfacesTableData(
      id: serializer.fromJson<int>(json['id']),
      roomId: serializer.fromJson<int>(json['roomId']),
      name: serializer.fromJson<String>(json['name']),
      maskPath: serializer.fromJson<String>(json['maskPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomId': serializer.toJson<int>(roomId),
      'name': serializer.toJson<String>(name),
      'maskPath': serializer.toJson<String>(maskPath),
    };
  }

  RoomSurfacesTableData copyWith(
          {int? id, int? roomId, String? name, String? maskPath}) =>
      RoomSurfacesTableData(
        id: id ?? this.id,
        roomId: roomId ?? this.roomId,
        name: name ?? this.name,
        maskPath: maskPath ?? this.maskPath,
      );
  RoomSurfacesTableData copyWithCompanion(RoomSurfacesTableCompanion data) {
    return RoomSurfacesTableData(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      name: data.name.present ? data.name.value : this.name,
      maskPath: data.maskPath.present ? data.maskPath.value : this.maskPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurfacesTableData(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('name: $name, ')
          ..write('maskPath: $maskPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomId, name, maskPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomSurfacesTableData &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.name == this.name &&
          other.maskPath == this.maskPath);
}

class RoomSurfacesTableCompanion
    extends UpdateCompanion<RoomSurfacesTableData> {
  final Value<int> id;
  final Value<int> roomId;
  final Value<String> name;
  final Value<String> maskPath;
  const RoomSurfacesTableCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.name = const Value.absent(),
    this.maskPath = const Value.absent(),
  });
  RoomSurfacesTableCompanion.insert({
    this.id = const Value.absent(),
    required int roomId,
    required String name,
    required String maskPath,
  })  : roomId = Value(roomId),
        name = Value(name),
        maskPath = Value(maskPath);
  static Insertable<RoomSurfacesTableData> custom({
    Expression<int>? id,
    Expression<int>? roomId,
    Expression<String>? name,
    Expression<String>? maskPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (name != null) 'name': name,
      if (maskPath != null) 'mask_path': maskPath,
    });
  }

  RoomSurfacesTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? roomId,
      Value<String>? name,
      Value<String>? maskPath}) {
    return RoomSurfacesTableCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      name: name ?? this.name,
      maskPath: maskPath ?? this.maskPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (maskPath.present) {
      map['mask_path'] = Variable<String>(maskPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurfacesTableCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('name: $name, ')
          ..write('maskPath: $maskPath')
          ..write(')'))
        .toString();
  }
}

class $UserDesignsTableTable extends UserDesignsTable
    with TableInfo<$UserDesignsTableTable, UserDesignsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDesignsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int> roomId = GeneratedColumn<int>(
      'room_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES rooms_table (id)'));
  static const VerificationMeta _laminateIdMeta =
      const VerificationMeta('laminateId');
  @override
  late final GeneratedColumn<int> laminateId = GeneratedColumn<int>(
      'laminate_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES laminates_table (id)'));
  static const VerificationMeta _savedAtMeta =
      const VerificationMeta('savedAt');
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
      'saved_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, roomId, laminateId, savedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_designs_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserDesignsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('laminate_id')) {
      context.handle(
          _laminateIdMeta,
          laminateId.isAcceptableOrUnknown(
              data['laminate_id']!, _laminateIdMeta));
    } else if (isInserting) {
      context.missing(_laminateIdMeta);
    }
    if (data.containsKey('saved_at')) {
      context.handle(_savedAtMeta,
          savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDesignsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDesignsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
      laminateId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}laminate_id'])!,
      savedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}saved_at'])!,
    );
  }

  @override
  $UserDesignsTableTable createAlias(String alias) {
    return $UserDesignsTableTable(attachedDatabase, alias);
  }
}

class UserDesignsTableData extends DataClass
    implements Insertable<UserDesignsTableData> {
  final int id;
  final int roomId;
  final int laminateId;
  final DateTime savedAt;
  const UserDesignsTableData(
      {required this.id,
      required this.roomId,
      required this.laminateId,
      required this.savedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_id'] = Variable<int>(roomId);
    map['laminate_id'] = Variable<int>(laminateId);
    map['saved_at'] = Variable<DateTime>(savedAt);
    return map;
  }

  UserDesignsTableCompanion toCompanion(bool nullToAbsent) {
    return UserDesignsTableCompanion(
      id: Value(id),
      roomId: Value(roomId),
      laminateId: Value(laminateId),
      savedAt: Value(savedAt),
    );
  }

  factory UserDesignsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDesignsTableData(
      id: serializer.fromJson<int>(json['id']),
      roomId: serializer.fromJson<int>(json['roomId']),
      laminateId: serializer.fromJson<int>(json['laminateId']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomId': serializer.toJson<int>(roomId),
      'laminateId': serializer.toJson<int>(laminateId),
      'savedAt': serializer.toJson<DateTime>(savedAt),
    };
  }

  UserDesignsTableData copyWith(
          {int? id, int? roomId, int? laminateId, DateTime? savedAt}) =>
      UserDesignsTableData(
        id: id ?? this.id,
        roomId: roomId ?? this.roomId,
        laminateId: laminateId ?? this.laminateId,
        savedAt: savedAt ?? this.savedAt,
      );
  UserDesignsTableData copyWithCompanion(UserDesignsTableCompanion data) {
    return UserDesignsTableData(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      laminateId:
          data.laminateId.present ? data.laminateId.value : this.laminateId,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDesignsTableData(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('laminateId: $laminateId, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomId, laminateId, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDesignsTableData &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.laminateId == this.laminateId &&
          other.savedAt == this.savedAt);
}

class UserDesignsTableCompanion extends UpdateCompanion<UserDesignsTableData> {
  final Value<int> id;
  final Value<int> roomId;
  final Value<int> laminateId;
  final Value<DateTime> savedAt;
  const UserDesignsTableCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.laminateId = const Value.absent(),
    this.savedAt = const Value.absent(),
  });
  UserDesignsTableCompanion.insert({
    this.id = const Value.absent(),
    required int roomId,
    required int laminateId,
    this.savedAt = const Value.absent(),
  })  : roomId = Value(roomId),
        laminateId = Value(laminateId);
  static Insertable<UserDesignsTableData> custom({
    Expression<int>? id,
    Expression<int>? roomId,
    Expression<int>? laminateId,
    Expression<DateTime>? savedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (laminateId != null) 'laminate_id': laminateId,
      if (savedAt != null) 'saved_at': savedAt,
    });
  }

  UserDesignsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? roomId,
      Value<int>? laminateId,
      Value<DateTime>? savedAt}) {
    return UserDesignsTableCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      laminateId: laminateId ?? this.laminateId,
      savedAt: savedAt ?? this.savedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    if (laminateId.present) {
      map['laminate_id'] = Variable<int>(laminateId.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDesignsTableCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('laminateId: $laminateId, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LaminatesTableTable laminatesTable = $LaminatesTableTable(this);
  late final $RoomsTableTable roomsTable = $RoomsTableTable(this);
  late final $RoomSurfacesTableTable roomSurfacesTable =
      $RoomSurfacesTableTable(this);
  late final $UserDesignsTableTable userDesignsTable =
      $UserDesignsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [laminatesTable, roomsTable, roomSurfacesTable, userDesignsTable];
}

typedef $$LaminatesTableTableCreateCompanionBuilder = LaminatesTableCompanion
    Function({
  Value<int> id,
  required String code,
  required String name,
  required String texturePath,
  required String finishType,
  required String colorPrimary,
  required int catalogueId,
  required String patternCategory,
});
typedef $$LaminatesTableTableUpdateCompanionBuilder = LaminatesTableCompanion
    Function({
  Value<int> id,
  Value<String> code,
  Value<String> name,
  Value<String> texturePath,
  Value<String> finishType,
  Value<String> colorPrimary,
  Value<int> catalogueId,
  Value<String> patternCategory,
});

final class $$LaminatesTableTableReferences extends BaseReferences<
    _$AppDatabase, $LaminatesTableTable, LaminatesTableData> {
  $$LaminatesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserDesignsTableTable, List<UserDesignsTableData>>
      _userDesignsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.userDesignsTable,
              aliasName: $_aliasNameGenerator(
                  db.laminatesTable.id, db.userDesignsTable.laminateId));

  $$UserDesignsTableTableProcessedTableManager get userDesignsTableRefs {
    final manager =
        $$UserDesignsTableTableTableManager($_db, $_db.userDesignsTable)
            .filter((f) => f.laminateId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_userDesignsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$LaminatesTableTableFilterComposer
    extends Composer<_$AppDatabase, $LaminatesTableTable> {
  $$LaminatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get texturePath => $composableBuilder(
      column: $table.texturePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get finishType => $composableBuilder(
      column: $table.finishType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorPrimary => $composableBuilder(
      column: $table.colorPrimary, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get catalogueId => $composableBuilder(
      column: $table.catalogueId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get patternCategory => $composableBuilder(
      column: $table.patternCategory,
      builder: (column) => ColumnFilters(column));

  Expression<bool> userDesignsTableRefs(
      Expression<bool> Function($$UserDesignsTableTableFilterComposer f) f) {
    final $$UserDesignsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userDesignsTable,
        getReferencedColumn: (t) => t.laminateId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserDesignsTableTableFilterComposer(
              $db: $db,
              $table: $db.userDesignsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LaminatesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LaminatesTableTable> {
  $$LaminatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get texturePath => $composableBuilder(
      column: $table.texturePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get finishType => $composableBuilder(
      column: $table.finishType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorPrimary => $composableBuilder(
      column: $table.colorPrimary,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get catalogueId => $composableBuilder(
      column: $table.catalogueId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get patternCategory => $composableBuilder(
      column: $table.patternCategory,
      builder: (column) => ColumnOrderings(column));
}

class $$LaminatesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LaminatesTableTable> {
  $$LaminatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get texturePath => $composableBuilder(
      column: $table.texturePath, builder: (column) => column);

  GeneratedColumn<String> get finishType => $composableBuilder(
      column: $table.finishType, builder: (column) => column);

  GeneratedColumn<String> get colorPrimary => $composableBuilder(
      column: $table.colorPrimary, builder: (column) => column);

  GeneratedColumn<int> get catalogueId => $composableBuilder(
      column: $table.catalogueId, builder: (column) => column);

  GeneratedColumn<String> get patternCategory => $composableBuilder(
      column: $table.patternCategory, builder: (column) => column);

  Expression<T> userDesignsTableRefs<T extends Object>(
      Expression<T> Function($$UserDesignsTableTableAnnotationComposer a) f) {
    final $$UserDesignsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userDesignsTable,
        getReferencedColumn: (t) => t.laminateId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserDesignsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.userDesignsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LaminatesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LaminatesTableTable,
    LaminatesTableData,
    $$LaminatesTableTableFilterComposer,
    $$LaminatesTableTableOrderingComposer,
    $$LaminatesTableTableAnnotationComposer,
    $$LaminatesTableTableCreateCompanionBuilder,
    $$LaminatesTableTableUpdateCompanionBuilder,
    (LaminatesTableData, $$LaminatesTableTableReferences),
    LaminatesTableData,
    PrefetchHooks Function({bool userDesignsTableRefs})> {
  $$LaminatesTableTableTableManager(
      _$AppDatabase db, $LaminatesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LaminatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LaminatesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LaminatesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> texturePath = const Value.absent(),
            Value<String> finishType = const Value.absent(),
            Value<String> colorPrimary = const Value.absent(),
            Value<int> catalogueId = const Value.absent(),
            Value<String> patternCategory = const Value.absent(),
          }) =>
              LaminatesTableCompanion(
            id: id,
            code: code,
            name: name,
            texturePath: texturePath,
            finishType: finishType,
            colorPrimary: colorPrimary,
            catalogueId: catalogueId,
            patternCategory: patternCategory,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String code,
            required String name,
            required String texturePath,
            required String finishType,
            required String colorPrimary,
            required int catalogueId,
            required String patternCategory,
          }) =>
              LaminatesTableCompanion.insert(
            id: id,
            code: code,
            name: name,
            texturePath: texturePath,
            finishType: finishType,
            colorPrimary: colorPrimary,
            catalogueId: catalogueId,
            patternCategory: patternCategory,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LaminatesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userDesignsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userDesignsTableRefs) db.userDesignsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userDesignsTableRefs)
                    await $_getPrefetchedData<LaminatesTableData,
                            $LaminatesTableTable, UserDesignsTableData>(
                        currentTable: table,
                        referencedTable: $$LaminatesTableTableReferences
                            ._userDesignsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LaminatesTableTableReferences(db, table, p0)
                                .userDesignsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.laminateId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$LaminatesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LaminatesTableTable,
    LaminatesTableData,
    $$LaminatesTableTableFilterComposer,
    $$LaminatesTableTableOrderingComposer,
    $$LaminatesTableTableAnnotationComposer,
    $$LaminatesTableTableCreateCompanionBuilder,
    $$LaminatesTableTableUpdateCompanionBuilder,
    (LaminatesTableData, $$LaminatesTableTableReferences),
    LaminatesTableData,
    PrefetchHooks Function({bool userDesignsTableRefs})>;
typedef $$RoomsTableTableCreateCompanionBuilder = RoomsTableCompanion Function({
  Value<int> id,
  required String name,
  required String category,
  required String imagePath,
});
typedef $$RoomsTableTableUpdateCompanionBuilder = RoomsTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> category,
  Value<String> imagePath,
});

final class $$RoomsTableTableReferences
    extends BaseReferences<_$AppDatabase, $RoomsTableTable, RoomsTableData> {
  $$RoomsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoomSurfacesTableTable,
      List<RoomSurfacesTableData>> _roomSurfacesTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.roomSurfacesTable,
          aliasName: $_aliasNameGenerator(
              db.roomsTable.id, db.roomSurfacesTable.roomId));

  $$RoomSurfacesTableTableProcessedTableManager get roomSurfacesTableRefs {
    final manager =
        $$RoomSurfacesTableTableTableManager($_db, $_db.roomSurfacesTable)
            .filter((f) => f.roomId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomSurfacesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$UserDesignsTableTable, List<UserDesignsTableData>>
      _userDesignsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.userDesignsTable,
              aliasName: $_aliasNameGenerator(
                  db.roomsTable.id, db.userDesignsTable.roomId));

  $$UserDesignsTableTableProcessedTableManager get userDesignsTableRefs {
    final manager =
        $$UserDesignsTableTableTableManager($_db, $_db.userDesignsTable)
            .filter((f) => f.roomId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_userDesignsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RoomsTableTableFilterComposer
    extends Composer<_$AppDatabase, $RoomsTableTable> {
  $$RoomsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  Expression<bool> roomSurfacesTableRefs(
      Expression<bool> Function($$RoomSurfacesTableTableFilterComposer f) f) {
    final $$RoomSurfacesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfacesTable,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfacesTableTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfacesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> userDesignsTableRefs(
      Expression<bool> Function($$UserDesignsTableTableFilterComposer f) f) {
    final $$UserDesignsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userDesignsTable,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserDesignsTableTableFilterComposer(
              $db: $db,
              $table: $db.userDesignsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoomsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomsTableTable> {
  $$RoomsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));
}

class $$RoomsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomsTableTable> {
  $$RoomsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  Expression<T> roomSurfacesTableRefs<T extends Object>(
      Expression<T> Function($$RoomSurfacesTableTableAnnotationComposer a) f) {
    final $$RoomSurfacesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomSurfacesTable,
            getReferencedColumn: (t) => t.roomId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomSurfacesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomSurfacesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> userDesignsTableRefs<T extends Object>(
      Expression<T> Function($$UserDesignsTableTableAnnotationComposer a) f) {
    final $$UserDesignsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userDesignsTable,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserDesignsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.userDesignsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RoomsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomsTableTable,
    RoomsTableData,
    $$RoomsTableTableFilterComposer,
    $$RoomsTableTableOrderingComposer,
    $$RoomsTableTableAnnotationComposer,
    $$RoomsTableTableCreateCompanionBuilder,
    $$RoomsTableTableUpdateCompanionBuilder,
    (RoomsTableData, $$RoomsTableTableReferences),
    RoomsTableData,
    PrefetchHooks Function(
        {bool roomSurfacesTableRefs, bool userDesignsTableRefs})> {
  $$RoomsTableTableTableManager(_$AppDatabase db, $RoomsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> imagePath = const Value.absent(),
          }) =>
              RoomsTableCompanion(
            id: id,
            name: name,
            category: category,
            imagePath: imagePath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String category,
            required String imagePath,
          }) =>
              RoomsTableCompanion.insert(
            id: id,
            name: name,
            category: category,
            imagePath: imagePath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {roomSurfacesTableRefs = false, userDesignsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (roomSurfacesTableRefs) db.roomSurfacesTable,
                if (userDesignsTableRefs) db.userDesignsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomSurfacesTableRefs)
                    await $_getPrefetchedData<RoomsTableData, $RoomsTableTable,
                            RoomSurfacesTableData>(
                        currentTable: table,
                        referencedTable: $$RoomsTableTableReferences
                            ._roomSurfacesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomsTableTableReferences(db, table, p0)
                                .roomSurfacesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.roomId == item.id),
                        typedResults: items),
                  if (userDesignsTableRefs)
                    await $_getPrefetchedData<RoomsTableData, $RoomsTableTable,
                            UserDesignsTableData>(
                        currentTable: table,
                        referencedTable: $$RoomsTableTableReferences
                            ._userDesignsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomsTableTableReferences(db, table, p0)
                                .userDesignsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.roomId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RoomsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomsTableTable,
    RoomsTableData,
    $$RoomsTableTableFilterComposer,
    $$RoomsTableTableOrderingComposer,
    $$RoomsTableTableAnnotationComposer,
    $$RoomsTableTableCreateCompanionBuilder,
    $$RoomsTableTableUpdateCompanionBuilder,
    (RoomsTableData, $$RoomsTableTableReferences),
    RoomsTableData,
    PrefetchHooks Function(
        {bool roomSurfacesTableRefs, bool userDesignsTableRefs})>;
typedef $$RoomSurfacesTableTableCreateCompanionBuilder
    = RoomSurfacesTableCompanion Function({
  Value<int> id,
  required int roomId,
  required String name,
  required String maskPath,
});
typedef $$RoomSurfacesTableTableUpdateCompanionBuilder
    = RoomSurfacesTableCompanion Function({
  Value<int> id,
  Value<int> roomId,
  Value<String> name,
  Value<String> maskPath,
});

final class $$RoomSurfacesTableTableReferences extends BaseReferences<
    _$AppDatabase, $RoomSurfacesTableTable, RoomSurfacesTableData> {
  $$RoomSurfacesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoomsTableTable _roomIdTable(_$AppDatabase db) =>
      db.roomsTable.createAlias(
          $_aliasNameGenerator(db.roomSurfacesTable.roomId, db.roomsTable.id));

  $$RoomsTableTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<int>('room_id')!;

    final manager = $$RoomsTableTableTableManager($_db, $_db.roomsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoomSurfacesTableTableFilterComposer
    extends Composer<_$AppDatabase, $RoomSurfacesTableTable> {
  $$RoomSurfacesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maskPath => $composableBuilder(
      column: $table.maskPath, builder: (column) => ColumnFilters(column));

  $$RoomsTableTableFilterComposer get roomId {
    final $$RoomsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.roomsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableTableFilterComposer(
              $db: $db,
              $table: $db.roomsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomSurfacesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomSurfacesTableTable> {
  $$RoomSurfacesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maskPath => $composableBuilder(
      column: $table.maskPath, builder: (column) => ColumnOrderings(column));

  $$RoomsTableTableOrderingComposer get roomId {
    final $$RoomsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.roomsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableTableOrderingComposer(
              $db: $db,
              $table: $db.roomsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomSurfacesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomSurfacesTableTable> {
  $$RoomSurfacesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get maskPath =>
      $composableBuilder(column: $table.maskPath, builder: (column) => column);

  $$RoomsTableTableAnnotationComposer get roomId {
    final $$RoomsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.roomsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.roomsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomSurfacesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomSurfacesTableTable,
    RoomSurfacesTableData,
    $$RoomSurfacesTableTableFilterComposer,
    $$RoomSurfacesTableTableOrderingComposer,
    $$RoomSurfacesTableTableAnnotationComposer,
    $$RoomSurfacesTableTableCreateCompanionBuilder,
    $$RoomSurfacesTableTableUpdateCompanionBuilder,
    (RoomSurfacesTableData, $$RoomSurfacesTableTableReferences),
    RoomSurfacesTableData,
    PrefetchHooks Function({bool roomId})> {
  $$RoomSurfacesTableTableTableManager(
      _$AppDatabase db, $RoomSurfacesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomSurfacesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomSurfacesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomSurfacesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roomId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> maskPath = const Value.absent(),
          }) =>
              RoomSurfacesTableCompanion(
            id: id,
            roomId: roomId,
            name: name,
            maskPath: maskPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roomId,
            required String name,
            required String maskPath,
          }) =>
              RoomSurfacesTableCompanion.insert(
            id: id,
            roomId: roomId,
            name: name,
            maskPath: maskPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomSurfacesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({roomId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (roomId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomId,
                    referencedTable:
                        $$RoomSurfacesTableTableReferences._roomIdTable(db),
                    referencedColumn:
                        $$RoomSurfacesTableTableReferences._roomIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RoomSurfacesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomSurfacesTableTable,
    RoomSurfacesTableData,
    $$RoomSurfacesTableTableFilterComposer,
    $$RoomSurfacesTableTableOrderingComposer,
    $$RoomSurfacesTableTableAnnotationComposer,
    $$RoomSurfacesTableTableCreateCompanionBuilder,
    $$RoomSurfacesTableTableUpdateCompanionBuilder,
    (RoomSurfacesTableData, $$RoomSurfacesTableTableReferences),
    RoomSurfacesTableData,
    PrefetchHooks Function({bool roomId})>;
typedef $$UserDesignsTableTableCreateCompanionBuilder
    = UserDesignsTableCompanion Function({
  Value<int> id,
  required int roomId,
  required int laminateId,
  Value<DateTime> savedAt,
});
typedef $$UserDesignsTableTableUpdateCompanionBuilder
    = UserDesignsTableCompanion Function({
  Value<int> id,
  Value<int> roomId,
  Value<int> laminateId,
  Value<DateTime> savedAt,
});

final class $$UserDesignsTableTableReferences extends BaseReferences<
    _$AppDatabase, $UserDesignsTableTable, UserDesignsTableData> {
  $$UserDesignsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoomsTableTable _roomIdTable(_$AppDatabase db) =>
      db.roomsTable.createAlias(
          $_aliasNameGenerator(db.userDesignsTable.roomId, db.roomsTable.id));

  $$RoomsTableTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<int>('room_id')!;

    final manager = $$RoomsTableTableTableManager($_db, $_db.roomsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $LaminatesTableTable _laminateIdTable(_$AppDatabase db) =>
      db.laminatesTable.createAlias($_aliasNameGenerator(
          db.userDesignsTable.laminateId, db.laminatesTable.id));

  $$LaminatesTableTableProcessedTableManager get laminateId {
    final $_column = $_itemColumn<int>('laminate_id')!;

    final manager = $$LaminatesTableTableTableManager($_db, $_db.laminatesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_laminateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$UserDesignsTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserDesignsTableTable> {
  $$UserDesignsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get savedAt => $composableBuilder(
      column: $table.savedAt, builder: (column) => ColumnFilters(column));

  $$RoomsTableTableFilterComposer get roomId {
    final $$RoomsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.roomsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableTableFilterComposer(
              $db: $db,
              $table: $db.roomsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LaminatesTableTableFilterComposer get laminateId {
    final $$LaminatesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.laminateId,
        referencedTable: $db.laminatesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LaminatesTableTableFilterComposer(
              $db: $db,
              $table: $db.laminatesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserDesignsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDesignsTableTable> {
  $$UserDesignsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get savedAt => $composableBuilder(
      column: $table.savedAt, builder: (column) => ColumnOrderings(column));

  $$RoomsTableTableOrderingComposer get roomId {
    final $$RoomsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.roomsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableTableOrderingComposer(
              $db: $db,
              $table: $db.roomsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LaminatesTableTableOrderingComposer get laminateId {
    final $$LaminatesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.laminateId,
        referencedTable: $db.laminatesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LaminatesTableTableOrderingComposer(
              $db: $db,
              $table: $db.laminatesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserDesignsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDesignsTableTable> {
  $$UserDesignsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);

  $$RoomsTableTableAnnotationComposer get roomId {
    final $$RoomsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.roomsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.roomsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LaminatesTableTableAnnotationComposer get laminateId {
    final $$LaminatesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.laminateId,
        referencedTable: $db.laminatesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LaminatesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.laminatesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserDesignsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserDesignsTableTable,
    UserDesignsTableData,
    $$UserDesignsTableTableFilterComposer,
    $$UserDesignsTableTableOrderingComposer,
    $$UserDesignsTableTableAnnotationComposer,
    $$UserDesignsTableTableCreateCompanionBuilder,
    $$UserDesignsTableTableUpdateCompanionBuilder,
    (UserDesignsTableData, $$UserDesignsTableTableReferences),
    UserDesignsTableData,
    PrefetchHooks Function({bool roomId, bool laminateId})> {
  $$UserDesignsTableTableTableManager(
      _$AppDatabase db, $UserDesignsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDesignsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDesignsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDesignsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roomId = const Value.absent(),
            Value<int> laminateId = const Value.absent(),
            Value<DateTime> savedAt = const Value.absent(),
          }) =>
              UserDesignsTableCompanion(
            id: id,
            roomId: roomId,
            laminateId: laminateId,
            savedAt: savedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roomId,
            required int laminateId,
            Value<DateTime> savedAt = const Value.absent(),
          }) =>
              UserDesignsTableCompanion.insert(
            id: id,
            roomId: roomId,
            laminateId: laminateId,
            savedAt: savedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserDesignsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({roomId = false, laminateId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (roomId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomId,
                    referencedTable:
                        $$UserDesignsTableTableReferences._roomIdTable(db),
                    referencedColumn:
                        $$UserDesignsTableTableReferences._roomIdTable(db).id,
                  ) as T;
                }
                if (laminateId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.laminateId,
                    referencedTable:
                        $$UserDesignsTableTableReferences._laminateIdTable(db),
                    referencedColumn: $$UserDesignsTableTableReferences
                        ._laminateIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$UserDesignsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserDesignsTableTable,
    UserDesignsTableData,
    $$UserDesignsTableTableFilterComposer,
    $$UserDesignsTableTableOrderingComposer,
    $$UserDesignsTableTableAnnotationComposer,
    $$UserDesignsTableTableCreateCompanionBuilder,
    $$UserDesignsTableTableUpdateCompanionBuilder,
    (UserDesignsTableData, $$UserDesignsTableTableReferences),
    UserDesignsTableData,
    PrefetchHooks Function({bool roomId, bool laminateId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LaminatesTableTableTableManager get laminatesTable =>
      $$LaminatesTableTableTableManager(_db, _db.laminatesTable);
  $$RoomsTableTableTableManager get roomsTable =>
      $$RoomsTableTableTableManager(_db, _db.roomsTable);
  $$RoomSurfacesTableTableTableManager get roomSurfacesTable =>
      $$RoomSurfacesTableTableTableManager(_db, _db.roomSurfacesTable);
  $$UserDesignsTableTableTableManager get userDesignsTable =>
      $$UserDesignsTableTableTableManager(_db, _db.userDesignsTable);
}
