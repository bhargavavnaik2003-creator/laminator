// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomSurfaceModel _$RoomSurfaceModelFromJson(Map<String, dynamic> json) =>
    RoomSurfaceModel(
      id: (json['id'] as num).toInt(),
      roomId: (json['roomId'] as num).toInt(),
      name: json['name'] as String,
      maskPath: json['maskPath'] as String,
    );

Map<String, dynamic> _$RoomSurfaceModelToJson(RoomSurfaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'name': instance.name,
      'maskPath': instance.maskPath,
    };

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: json['category'] as String,
      imagePath: json['imagePath'] as String,
      surfaces: (json['surfaces'] as List<dynamic>)
          .map((e) => RoomSurfaceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'imagePath': instance.imagePath,
      'surfaces': instance.surfaces,
    };
