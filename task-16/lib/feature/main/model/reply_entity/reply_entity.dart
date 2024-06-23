import 'package:json_annotation/json_annotation.dart';

part 'reply_entity.g.dart';

@JsonSerializable()
class ReplyEntity {
  final String text;

  ReplyEntity({
    required this.text,
  });

  factory ReplyEntity.fromJson(Map<String, dynamic> json) =>
      _$ReplyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyEntityToJson(this);
}
