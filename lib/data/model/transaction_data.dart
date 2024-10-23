import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_data.g.dart';

@HiveType(typeId: 0)
class TransactionData {
  @HiveField(0)
  String? transactionId;
  @HiveField(1)
  String? transactionDate;
  @HiveField(2)
  String? transactionAmount;
  @HiveField(3)
  String? transactionType;
  @HiveField(4)
  String? transactionCategory;
  @HiveField(5)
  String? transactionNote;

  TransactionData(
      {this.transactionId,
      this.transactionDate,
      this.transactionAmount,
      this.transactionType,
      this.transactionCategory,
      this.transactionNote});
}

@HiveType(typeId: 1)
class TransactionType {
  @HiveField(0)
  String? income;
  @HiveField(1)
  String? expense;

  TransactionType({this.income, this.expense});
}

@HiveType(typeId: 2)
class TransactionCategory {
  @HiveField(0)
  String? salary;
  @HiveField(1)
  String? rent;
  @HiveField(2)
  String? grocery;
  @HiveField(3)
  String? shopping;
  @HiveField(4)
  String? fuel;
  @HiveField(5)
  String? entertainment;
  @HiveField(6)
  String? other;

  TransactionCategory(
      {this.salary,
      this.rent,
      this.grocery,
      this.shopping,
      this.fuel,
      this.entertainment,
      this.other});
}
