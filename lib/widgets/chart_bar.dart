// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text(' €${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
