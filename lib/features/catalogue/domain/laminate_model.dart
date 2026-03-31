import 'package:json_annotation/json_annotation.dart';

part 'laminate_model.g.dart';

/// Represents a single laminate product in the catalogue.
///
/// [texturePath] is a Flutter asset path, e.g. `assets/textures/oak_natural.png`.
/// [colorPrimary] is a hex string used by the AI colour-matching feature.
@JsonSerializable()
class LaminateModel {
  final int id;
  final String code;
  final String name;
  final String texturePath;
  final String finishType; // matte | gloss | suede | woodmatt
  final String colorPrimary; // hex e.g. "#C8A96E"
  final int catalogueId;
  final String patternCategory; // wood | stone | fabric | plain

  const LaminateModel({
    required this.id,
    required this.code,
    required this.name,
    required this.texturePath,
    required this.finishType,
    required this.colorPrimary,
    required this.catalogueId,
    required this.patternCategory,
  });

  factory LaminateModel.fromJson(Map<String, dynamic> json) =>
      _$LaminateModelFromJson(json);

  Map<String, dynamic> toJson() => _$LaminateModelToJson(this);

  @override
  String toString() => 'LaminateModel($code, $finishType)';
}
