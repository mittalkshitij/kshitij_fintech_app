import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kshitij_fintech_app/data/model/transaction_data.dart';

class HiveRepo {
  final transactionBoxName = 'transactionBox';

  void registerAdapter() {
    Hive.registerAdapter(TransactionDataAdapter());
  }

  Future addTransactionToHive(TransactionData transactionData) async {
    final transactionBox = await Hive.openBox<TransactionData>(transactionBoxName);
    if (transactionBox.isOpen) {
      await transactionBox.put(transactionData.transactionId, transactionData);
    } else {
      throw Exception('Box is not open');
    }
  }

  Future<List<TransactionData>> getAllTransactionsFromHive() async {
    final transactionBox = await Hive.openBox<TransactionData>(transactionBoxName);
    if (transactionBox.isOpen) {
      return transactionBox.values.toList();
    } else {
      throw Exception('Box is not open');
    }
  }

  Future<void> deleteTransaction(String transactionId) async {
    final transactionBox = await Hive.openBox<TransactionData>(transactionBoxName);
    if (transactionBox.isOpen) {
      return transactionBox.delete(transactionId);
    } else {
      throw Exception('Box is not open');
    }
  }

}

final hiveRepoProvider = Provider<HiveRepo>((ref) => HiveRepo());