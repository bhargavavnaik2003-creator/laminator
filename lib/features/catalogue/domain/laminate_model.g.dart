// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laminate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaminateModel _$LaminateModelFromJson(Map<String, dynamic> json) =>
    LaminateModel(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      texturePath: json['texturePath'] as String,
      finishType: json['finishType'] as String,
      colorPrimary: json['colorPrimary'] as String,
      catalogueId: (json['catalogueId'] as num).toInt(),
      patternCategory: json['patternCategory'] as String,
    );

Map<String, dynamic> _$LaminateModelToJson(LaminateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'texturePath': instance.texturePath,
      'finishType': instance.finishType,
      'colorPrimary': instance.colorPrimary,
      'catalogueId': instance.catalogueId,
      'patternCategory': instance.patternCategory,
    };
