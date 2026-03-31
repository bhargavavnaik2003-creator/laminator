import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

/// Represents a distinct editable surface inside a room.
@JsonSerializable()
class RoomSurfaceModel {
  final int id;
  final int roomId;
  final String name;
  final String maskPath;

  const RoomSurfaceModel({
    required this.id,
    required this.roomId,
    required this.name,
    required this.maskPath,
  });

  factory RoomSurfaceModel.fromJson(Map<String, dynamic> json) =>
      _$RoomSurfaceModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoomSurfaceModelToJson(this);
}

/// Represents a room preset in the visualizer.
@JsonSerializable()
class RoomModel {
  final int id;
  final String name;
  final String category; // living | bedroom | kitchen | bathroom
  final String imagePath; // background photo asset path
  final List<RoomSurfaceModel> surfaces;

  const RoomModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imagePath,
    required this.surfaces,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);

  @override
  String toString() => 'RoomModel($name, $category)';
}
