// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter_basic_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [];

  List<Transaction> getTransaction() {
    return transactions;
  }

  addTransaction(Transaction statement) {
    transactions.insert(0, statement);
    notifyListeners(); //alert Consumer
  }
}
