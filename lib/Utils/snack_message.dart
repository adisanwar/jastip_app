import 'package:flutter/material.dart';
import 'package:jastip_app/Styles/colors.dart';


void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message!,
        style: TextStyle(color: white),
      ),
      backgroundColor: primaryColor));
}
