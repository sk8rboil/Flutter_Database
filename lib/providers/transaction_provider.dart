// ignore_for_file: annotate_overrides, avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter_basic_database/local_database/transaction_db.dart';
import 'package:flutter_basic_database/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  addTransaction(Transactions statement) async {
    var db = await TransactionDB(dbName: "transaction.db")
        .openDatabase(); //keep data in db
    print(db);
    transactions.insert(0, statement);
    notifyListeners(); //alert Consumer
  }
}
