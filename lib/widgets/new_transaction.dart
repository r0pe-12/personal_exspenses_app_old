import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  NewTransaction({super.key, required this.addNewTransaction});

  // String? titleInput;
  // String? amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text) ?? 0;
    if (title.isEmpty || amount <= 0) {
      return;
    }
    addNewTransaction(
      title,
      amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              // onChanged: ((value) => titleInput = value),
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              // onChanged: ((value) => amountInput = value),
              controller: amountController,
              onSubmitted: (_) => _submitData(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done, // default
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.purple),
              onPressed: _submitData,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
