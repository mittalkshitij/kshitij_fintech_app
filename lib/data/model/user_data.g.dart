// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 0;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      userId: fields[0] as String?,
      userName: fields[1] as String?,
      userPassword: fields[2] as String?,
      userTransactions: fields[3] as String?,
      userCurrency: fields[4] as String?,
      userBalance: fields[5] as String?,
      userIncome: fields[6] as String?,
      userExpense: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userPassword)
      ..writeByte(3)
      ..write(obj.userTransactions)
      ..writeByte(4)
      ..write(obj.userCurrency)
      ..writeByte(5)
      ..write(obj.userBalance)
      ..writeByte(6)
      ..write(obj.userIncome)
      ..writeByte(7)
      ..write(obj.userExpense);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
