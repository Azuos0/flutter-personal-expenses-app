import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text) ?? -1;

    if (title.isNotEmpty && amount >= 0) {
      widget.addTx(
        title,
        amount,
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              onSubmitted: (_) => submitData,
              controller: titleController,
              cursorColor: Colors.purple,
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
                labelText: 'Title',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            TextField(
              onSubmitted: (_) => submitData,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                labelText: 'Amount',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text('No date chosen'),
                  TextButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                // style: TextStyle(
                //   color: Colors.black,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
