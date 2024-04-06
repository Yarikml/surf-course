import 'package:json_annotation/json_annotation.dart';

part 'color_entity.g.dart';

@JsonSerializable()
class ColorEntity {
  /// The generated code assumes these values exist in JSON.
  final String name;
  final String? value;

  ColorEntity({
    required this.name,
    this.value,
  });

  factory ColorEntity.fromJson(Map<String, dynamic> json) =>
      _$ColorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ColorEntityToJson(this);
}
