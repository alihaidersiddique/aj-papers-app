// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'yearly_paper_model.dart';

part 'subject_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class SubjectModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String courseName;

  @HiveField(2)
  final int courseCode;

  @HiveField(3)
  final String level;

  @HiveField(4)
  final bool isBookmarked;

  @HiveField(5)
  final List<YearlyPaperModel> yearlyPapers;

  SubjectModel({
    required this.id,
    required this.courseName,
    required this.courseCode,
    required this.level,
    required this.isBookmarked,
    required this.yearlyPapers,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);

  SubjectModel copyWith({
    int? id,
    String? courseName,
    int? courseCode,
    String? level,
    bool? isBookmarked,
    List<YearlyPaperModel>? yearlyPapers,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
      level: level ?? this.level,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      yearlyPapers: yearlyPapers ?? this.yearlyPapers,
    );
  }
}
