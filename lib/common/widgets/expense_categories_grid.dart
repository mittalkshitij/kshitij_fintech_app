import 'package:flutter/material.dart';

import '../../utils/helpers.dart';

class ExpenseCategoriesGrid extends StatelessWidget {
  const ExpenseCategoriesGrid({
    super.key,
    required this.transactionCategories,
    required this.onCategorySelected,
    this.selectedCategory,
  });

  final List<String> transactionCategories;
  final Function(String) onCategorySelected;
  final String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // To prevent infinite height issues
      itemCount: transactionCategories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final category = transactionCategories[index];
        final isSelected = category == selectedCategory;

        return GestureDetector(
          onTap: () => onCategorySelected(category),
          child: Card(
            color: isSelected
                ? Colors.orange
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: isSelected ? Colors.orange : Colors.grey,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                category,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
