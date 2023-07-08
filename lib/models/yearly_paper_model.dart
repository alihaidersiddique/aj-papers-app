import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'paper_model.dart';

part 'yearly_paper_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class YearlyPaperModel extends HiveObject {
  @HiveField(0)
  final String year;

  @HiveField(1)
  final List<PaperModel> papers;

  YearlyPaperModel({
    required this.year,
    required this.papers,
  });

  factory YearlyPaperModel.fromJson(Map<String, dynamic> json) =>
      _$YearlyPaperModelFromJson(json);

  Map<String, dynamic> toJson() => _$YearlyPaperModelToJson(this);
}
