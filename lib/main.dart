// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_basic_database/homepage.dart';
import 'package:flutter_basic_database/providers/transaction_provider.dart';
import 'package:flutter_basic_database/screens/form_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Colors.lightGreen,
          ),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          '/homepage': (context) => MyHomePage(title: ''),
          '/formscreen': (context) => FormScreen(),
        },
      ),
    );
  }
}
