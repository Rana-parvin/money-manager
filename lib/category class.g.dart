// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class categoryclassAdapter extends TypeAdapter<categoryclass> {
  @override
  final int typeId = 2;

  @override
  categoryclass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return categoryclass(
      id: fields[0] as String,
      name: fields[1] as String,
      isdeleted: fields[2] as bool,
      type: fields[3] as categorytype,
    );
  }

  @override
  void write(BinaryWriter writer, categoryclass obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isdeleted)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is categoryclassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class categorytypeAdapter extends TypeAdapter<categorytype> {
  @override
  final int typeId = 1;

  @override
  categorytype read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return categorytype.income;
      case 1:
        return categorytype.expense;
      default:
        return categorytype.income;
    }
  }

  @override
  void write(BinaryWriter writer, categorytype obj) {
    switch (obj) {
      case categorytype.income:
        writer.writeByte(0);
        break;
      case categorytype.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is categorytypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
