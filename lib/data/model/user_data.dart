import 'package:hive_flutter/hive_flutter.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  String? userPassword;
  @HiveField(3)
  String? userTransactions;
  @HiveField(4)
  String? userCurrency;
  @HiveField(5)
  String? userBalance;
  @HiveField(6)
  String? userIncome;
  @HiveField(7)
  String? userExpense;

  UserData(
      {this.userId,
      this.userName,
      this.userPassword,
      this.userTransactions,
      this.userCurrency,
      this.userBalance,
      this.userIncome,
      this.userExpense});
}
