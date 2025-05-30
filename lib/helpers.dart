import 'package:flutter/material.dart';

double widgetPadding(BuildContext context, {double paddingPercent = 1}) =>
    MediaQuery.of(context).size.width * paddingPercent * 0.01;

double getWidth(BuildContext context, {double percent = 100}) =>
    MediaQuery.of(context).size.width * percent * 0.01;
double getHeight(BuildContext context, {double percent = 100}) =>
    MediaQuery.of(context).size.height * percent * 0.01;

InputDecoration getInputDecoration(String? title) {
  return InputDecoration(
    labelText: title ?? "",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
  );
}
