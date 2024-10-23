import 'package:flutter/material.dart';

import 'color.dart';

class Helpers {
  static Color? getExpenseCardColor({required String expenseType}) {
    switch (expenseType) {
      case 'Salary':
        return lightGreen;
      case 'Rent':
        return darkRed;
      case 'Grocery':
        return lightBlue;
      case 'Shopping':
        return Colors.amber;
      case 'Fuel':
        return lightGreen;
      case 'Entertainment':
        return lightBlue;
      case 'Other':
        return Colors.orange[900];
      default:
        return lightBlue;
    }
  }
}
