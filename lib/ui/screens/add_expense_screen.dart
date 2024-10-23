import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kshitij_fintech_app/data/model/transaction_data.dart';

import '../../common/widgets/expense_categories_grid.dart';
import '../../repo/hive_repo.dart';

class AddExpenseScreen extends ConsumerStatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  ConsumerState<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  String? _transactionType;
  String? _selectedCategory;
  String? _selectedType;
  final List<String> _transactionCategory = [
    'Salary',
    'Rent',
    'Grocery',
    'Shopping',
    'Fuel',
    'Entertainment',
    'Other'
  ];

  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transaction Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _transactionType = 'Income';
                    });
                  },
                  child: Card(
                    color: _transactionType == 'Income'
                        ? Colors.orange
                        : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: _transactionType == 'Income'
                            ? Colors.orange
                            : Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _transactionType = 'Expense';
                    });
                  },
                  child: Card(
                    color: _transactionType == 'Expense'
                        ? Colors.orange
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: _transactionType == 'Expense'
                            ? Colors.orange
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Transaction Category
            const Text(
              'Transaction Category',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ExpenseCategoriesGrid(
              transactionCategories: _transactionCategory,
              onCategorySelected: (selectedCategory) {
                setState(() {
                  _selectedCategory = selectedCategory;
                });
              },
              selectedCategory: _selectedCategory,
            ),
            const SizedBox(height: 16.0),

            // Transaction Amount
            const Text(
              'Transaction Amount (INR)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Transaction Note
            const Text(
              'Transaction Note',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: noteController,
              decoration: const InputDecoration(
                hintText: 'Add a note (Optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(hiveRepoProvider).addTransactionToHive(TransactionData(
                      transactionId: "1",
                      transactionAmount: amountController.text,
                      transactionNote: noteController.text,
                      transactionType: _transactionType,
                      transactionCategory: _selectedCategory));
                },
                child: const Text('Add Transaction'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
