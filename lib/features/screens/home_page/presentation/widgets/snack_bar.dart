import 'package:flutter/material.dart';
import 'package:news_app/config/themes/styles.dart';

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.tealAccent,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: textInSnackBar,
      ),
    ),
  );
}
