// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transacton classmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class transactionclassAdapter extends TypeAdapter<transactionclass> {
  @override
  final int typeId = 3;

  @override
  transactionclass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return transactionclass(
      amount: fields[0] as double,
      type: fields[1] as categorytype,
      category: fields[4] as categoryclass,
      datetime: fields[3] as String,
      purpose: fields[2] as String,
    )..id = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, transactionclass obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.purpose)
      ..writeByte(3)
      ..write(obj.datetime)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is transactionclassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
