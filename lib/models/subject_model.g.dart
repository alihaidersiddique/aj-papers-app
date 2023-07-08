// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectModelAdapter extends TypeAdapter<SubjectModel> {
  @override
  final int typeId = 0;

  @override
  SubjectModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubjectModel(
      id: fields[0] as int,
      courseName: fields[1] as String,
      courseCode: fields[2] as int,
      level: fields[3] as String,
      isBookmarked: fields[4] as bool,
      yearlyPapers: (fields[5] as List).cast<YearlyPaperModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SubjectModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.courseName)
      ..writeByte(2)
      ..write(obj.courseCode)
      ..writeByte(3)
      ..write(obj.level)
      ..writeByte(4)
      ..write(obj.isBookmarked)
      ..writeByte(5)
      ..write(obj.yearlyPapers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) => SubjectModel(
      id: json['id'] as int,
      courseName: json['courseName'] as String,
      courseCode: json['courseCode'] as int,
      level: json['level'] as String,
      isBookmarked: json['isBookmarked'] as bool,
      yearlyPapers: (json['yearlyPapers'] as List<dynamic>)
          .map((e) => YearlyPaperModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseName': instance.courseName,
      'courseCode': instance.courseCode,
      'level': instance.level,
      'isBookmarked': instance.isBookmarked,
      'yearlyPapers': instance.yearlyPapers,
    };
