import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  const TransactionList({super.key, required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...userTransactions.map((tx) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                    '${tx.amount} €',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      tx.title,
                    ),
                    Text(
                      style: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                      DateFormat.yMMMMd().format(tx.date),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList()
      ],
    );
  }
}