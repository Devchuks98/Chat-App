import 'package:chat_app/shared/constants.dart';
import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Constants.primaryColor, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Constants.primaryColor, width: 2),
    borderRadius: BorderRadius.circular(10),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Constants.primaryColor, width: 2),
    borderRadius: BorderRadius.circular(10),
  ),
);

void nextScreen(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}
