import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletTransaction {
  final String transactionType;
  final double amount;
  final double previousBalance;
  final double currentBalance;
  final DateTime transactionDate;

  WalletTransaction({
    required this.transactionType,
    required this.amount,
    required this.previousBalance,
    required this.currentBalance,
    required this.transactionDate,
  });
}

class HistoryPage extends StatelessWidget {
  final List<WalletTransaction> transactions = [
    WalletTransaction(
      transactionType: "Top Up",
      amount: 100.0,
      previousBalance: 0.0,
      currentBalance: 100.0,
      transactionDate: DateTime(2023, 6, 10),
    ),
    WalletTransaction(
      transactionType: "Withdrawal",
      amount: 50.0,
      previousBalance: 100.0,
      currentBalance: 50.0,
      transactionDate: DateTime(2023, 6, 12),
    ),
    WalletTransaction(
      transactionType: "Top Up",
      amount: 200.0,
      previousBalance: 50.0,
      currentBalance: 250.0,
      transactionDate: DateTime(2023, 6, 14),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          final isDeposit = transaction.transactionType == 'Top Up';
          final amountSign = isDeposit ? '+' : '-';
          final amountColor = isDeposit ? Colors.green : Colors.red;
          final formattedDate =
              DateFormat('d-M-y').format(transaction.transactionDate);

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(transaction.transactionType),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '\Rp${transaction.previousBalance} -> \Rp${transaction.currentBalance}'),
                            Text('Date: ${formattedDate}'),
                          ],
                        ),
                        Text(
                          'Amount: $amountSign\Rp${transaction.amount}',
                          style: TextStyle(
                            color: amountColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
