import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) =>
        const Divider(),
        itemCount: 0,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Row(),
          );
        });
  }
}
