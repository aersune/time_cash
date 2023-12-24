// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransferDataAdapter extends TypeAdapter<TransferData> {
  @override
  final int typeId = 0;

  @override
  TransferData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransferData(
      isIncome: fields[0] as bool,
      transCost: fields[1] as int,
    )..date = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, TransferData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isIncome)
      ..writeByte(1)
      ..write(obj.transCost)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransferDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
