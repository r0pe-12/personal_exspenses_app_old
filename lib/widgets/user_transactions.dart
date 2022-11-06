import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Samsung S21',
      amount: 660.56,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Intel i9',
      amount: 660.56,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Nvidia RTX 4090',
      amount: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Iphone 14 pro',
      amount: 999.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Iphone 13',
      amount: 846.59,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Galaxy Buds 2',
      amount: 176.98,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction: _addNewTransaction),
        TransactionList(userTransactions: _userTransactions),
      ],
    );
  }
}
