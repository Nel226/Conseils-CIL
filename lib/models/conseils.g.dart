// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conseils.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConseilAdapter extends TypeAdapter<Conseil> {
  @override
  final int typeId = 1;

  @override
  Conseil read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Conseil()
      ..titre = fields[0] as String
      ..description = fields[1] as String
      ..image = fields[2] as String
      ..favori = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Conseil obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.titre)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.favori);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConseilAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
