// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'SFPro',
        appBarTheme: AppBarTheme(
            titleTextStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 800,
      date: DateTime.now().subtract(Duration(days: 1)),
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

  // final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

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

  void showModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return NewTransaction(addNewTransaction: _addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showModal(context);
            },
            icon: const Icon(CupertinoIcons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
                width: double.infinity,
                child: Chart(
                  recentTransactions: _recentTransactions,
                )),
            TransactionList(userTransactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal(context);
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
