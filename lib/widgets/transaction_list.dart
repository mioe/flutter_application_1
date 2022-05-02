import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(children: [
            Text(
              'No transactions added yet!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/images/cat.jpg',
                fit: BoxFit.cover,
              ),
            )
          ])
        : ListView.builder(
            itemBuilder: (ctx, idx) {
              return Card(
                elevation: 6,
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text('\$${transactions[idx].amount}'),
                      ),
                    ),
                  ),
                  title: Text(transactions[idx].title),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[idx].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () => deleteTx(transactions[idx].id),
                  ),
                ),
              );
              // return Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).colorScheme.primary,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$${transactions[idx].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //             fontSize: 20,
              //             color: Theme.of(context).colorScheme.primary,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             transactions[idx].title,
              //             style: TextStyle(
              //               fontWeight: FontWeight.w600,
              //               fontSize: 16,
              //             ),
              //           ),
              //           Text(
              //             DateFormat.yMMMd().format(transactions[idx].date),
              //             style: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
            },
            itemCount: transactions.length,
          );
  }
}
