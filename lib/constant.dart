// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Myconstant {
  OutlineInputBorder myborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.green.shade100,
        width: 3,
      ),
    );
  }

  InputDecoration mydecoration(String label) {
    return InputDecoration(
        border: Myconstant().myborder(),
        enabledBorder: Myconstant().myborder(),
        focusedBorder: Myconstant().myborder(),
        labelText: label);
  }
}
