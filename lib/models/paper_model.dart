import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paper_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class PaperModel extends HiveObject {
  @HiveField(0)
  final String course;

  @HiveField(1)
  final String type;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String paper;

  @HiveField(4)
  final String variant;

  @HiveField(5)
  final String season;

  @HiveField(6)
  final String year;

  @HiveField(7)
  final String link;

  @HiveField(8)
  final String filePath;

  PaperModel({
    required this.course,
    required this.type,
    required this.name,
    required this.paper,
    required this.variant,
    required this.season,
    required this.year,
    required this.link,
    required this.filePath,
  });

  factory PaperModel.fromJson(Map<String, dynamic> json) =>
      _$PaperModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaperModelToJson(this);
}
