import 'package:flutter/material.dart';

Bar(String barTitle) {
    return AppBar(
      title: Text(barTitle, style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.red,
      elevation: 4,
      shadowColor: Colors.black,
    );
  }