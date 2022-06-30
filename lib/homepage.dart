// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic_database/models/transaction.dart';
import 'package:flutter_basic_database/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/formscreen');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, child) {
          return ListView.builder(
            itemBuilder: ((context, index) {
              Transaction data = provider.transactions[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: FittedBox(
                      child: Text(data.amount.toString()),
                    ),
                  ),
                  title: Text(data.title),
                  subtitle: Text(data.date.toString()),
                ),
              );
            }),
            itemCount: provider.transactions.length,
          );
        },
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
