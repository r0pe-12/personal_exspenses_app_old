// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ...groupedTransactions.reversed.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'].toString(),
                    double.parse(data['amount'].toString()),
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              );
              // return Text('${data['day']}: ${data['amount']}');
            }).toList(),
          ],
        ),
      ),
    );
  }
}
