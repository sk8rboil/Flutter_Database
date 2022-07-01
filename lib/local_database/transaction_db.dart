// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TransactionDB {
  String dbName;

  TransactionDB({
    required this.dbName,
  });

  Future<String> openDatabase() async {
    //find database path
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    return dbLocation;
  }

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
