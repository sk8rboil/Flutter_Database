// ignore_for_file: public_member_api_docs, sort_constructors_first, await_only_futures, unnecessary_this, non_constant_identifier_names, unused_import
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter_basic_database/models/transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  String dbName;

  TransactionDB({
    required this.dbName,
  });

  Future<Database> openDatabase() async {
    //find database path
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    //create database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> InsertData(Transactions statement) async {
    //transaction.db => expense
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    //json
    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String(),
    });
    db.close();
    return keyID;
  }

  //ดึงข้อมูล
  loadAllData() async {}

  TransactionDB copyWith({
    String? dbName,
  }) {
    return TransactionDB(
      dbName: dbName ?? this.dbName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dbName': dbName,
    };
  }

  factory TransactionDB.fromMap(Map<String, dynamic> map) {
    return TransactionDB(
      dbName: map['dbName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionDB.fromJson(String source) =>
      TransactionDB.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TransactionDB(dbName: $dbName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionDB && other.dbName == dbName;
  }

  @override
  int get hashCode => dbName.hashCode;
}
