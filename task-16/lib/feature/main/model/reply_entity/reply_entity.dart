import 'package:json_annotation/json_annotation.dart';

part 'reply_entity.g.dart';

@JsonSerializable()
class ReplyEntity {
  final String reading;

  ReplyEntity({
    required this.reading,
  });

  factory ReplyEntity.fromJson(Map<String, dynamic> json) =>
      _$ReplyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyEntityToJson(this);
}
