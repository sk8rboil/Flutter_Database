// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_basic_database/constant.dart';
import 'package:flutter_basic_database/models/transaction.dart';
import 'package:flutter_basic_database/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController amountcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          validator: ((input) {
                            if (input!.isEmpty) {
                              return "กรุณากรอกข้อมูล";
                            } else {
                              return null;
                            }
                          }),
                          keyboardType: TextInputType.text,
                          controller: titlecontroller,
                          decoration: Myconstant().mydecoration('ชื่อรายการ')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          validator: ((input) {
                            if (input!.isEmpty) {
                              return "กรุณาจำนวนเงิน";
                            } else if (double.parse(input) <= 0) {
                              return "กรุณาใส่ตัวเลขที่มากกว่า 0";
                            } else {
                              return null;
                            }
                          }),
                          keyboardType: TextInputType.number,
                          controller: amountcontroller,
                          decoration: Myconstant().mydecoration('จำนวนเงิน')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          formKey.currentState!.save();

                          String title = titlecontroller.text;
                          String amount = amountcontroller.text;

                          Transaction statement = Transaction(
                              title: title,
                              amount: double.parse(amount),
                              date: DateTime.now());

                          var provider = Provider.of<TransactionProvider>(
                              context,
                              listen: false);
                          provider.addTransaction(statement);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );

                          Navigator.pop(context);
                        }
                      },
                      child: Text('CONFIRM'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
