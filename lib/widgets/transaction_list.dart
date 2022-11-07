// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  const TransactionList({super.key, required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: userTransactions.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
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
                            color: Theme.of(context).primaryColorLight,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          '${userTransactions[index].amount.toStringAsFixed(2)} €',
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
                            userTransactions[index].title,
                          ),
                          Text(
                            style: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                            DateFormat.yMMMMd()
                                .format(userTransactions[index].date),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: userTransactions.length,
            )
          : Column(
              children: <Widget>[
                Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  'No transactions added yet!',
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
    );
  }
}
