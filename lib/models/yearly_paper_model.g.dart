// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yearly_paper_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YearlyPaperModelAdapter extends TypeAdapter<YearlyPaperModel> {
  @override
  final int typeId = 1;

  @override
  YearlyPaperModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YearlyPaperModel(
      year: fields[0] as String,
      papers: (fields[1] as List).cast<PaperModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, YearlyPaperModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.year)
      ..writeByte(1)
      ..write(obj.papers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YearlyPaperModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YearlyPaperModel _$YearlyPaperModelFromJson(Map<String, dynamic> json) =>
    YearlyPaperModel(
      year: json['year'] as String,
      papers: (json['papers'] as List<dynamic>)
          .map((e) => PaperModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$YearlyPaperModelToJson(YearlyPaperModel instance) =>
    <String, dynamic>{
      'year': instance.year,
      'papers': instance.papers,
    };
