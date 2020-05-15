// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'botmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BotmodelAdapter extends TypeAdapter<Botmodel> {
  final typeId = 1;
  @override
  Botmodel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Botmodel(
      term: fields[1] as String,
      meaning: fields[2] as String,
      innerLink: (fields[3] as List)?.cast<dynamic>(),
      id: fields[0] as String,
      isFavorite: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Botmodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.term)
      ..writeByte(2)
      ..write(obj.meaning)
      ..writeByte(3)
      ..write(obj.innerLink)
      ..writeByte(4)
      ..write(obj.isFavorite);
  }
}
