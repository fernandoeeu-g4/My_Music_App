// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final typeId = 0;

  @override
  UserData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      username: fields[0] as String,
      email: fields[1] as String,
      googleId: fields[2] as String,
      token: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.googleId)
      ..writeByte(3)
      ..write(obj.token);
  }
}
