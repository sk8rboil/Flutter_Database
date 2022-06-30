import 'package:flutter/foundation.dart';
import 'package:flutter_basic_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: 'title1', amount: 500, date: DateTime.now()),
    Transaction(title: 'title2', amount: 400, date: DateTime.now()),
    Transaction(title: 'title3', amount: 300, date: DateTime.now()),
  ];

  List<Transaction> gryTransaction() {
    return transactions;
  }

  addTransaction(Transaction statement) {}
}
