// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaperModelAdapter extends TypeAdapter<PaperModel> {
  @override
  final int typeId = 2;

  @override
  PaperModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaperModel(
      course: fields[0] as String,
      type: fields[1] as String,
      name: fields[2] as String,
      paper: fields[3] as String,
      variant: fields[4] as String,
      season: fields[5] as String,
      year: fields[6] as String,
      link: fields[7] as String,
      filePath: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PaperModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.course)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.paper)
      ..writeByte(4)
      ..write(obj.variant)
      ..writeByte(5)
      ..write(obj.season)
      ..writeByte(6)
      ..write(obj.year)
      ..writeByte(7)
      ..write(obj.link)
      ..writeByte(8)
      ..write(obj.filePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaperModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaperModel _$PaperModelFromJson(Map<String, dynamic> json) => PaperModel(
      course: json['course'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      paper: json['paper'] as String,
      variant: json['variant'] as String,
      season: json['season'] as String,
      year: json['year'] as String,
      link: json['link'] as String,
      filePath: json['filePath'] as String,
    );

Map<String, dynamic> _$PaperModelToJson(PaperModel instance) =>
    <String, dynamic>{
      'course': instance.course,
      'type': instance.type,
      'name': instance.name,
      'paper': instance.paper,
      'variant': instance.variant,
      'season': instance.season,
      'year': instance.year,
      'link': instance.link,
      'filePath': instance.filePath,
    };
