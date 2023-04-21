import 'package:flutter/material.dart';

CustomContainer(Widget child) {
  return Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
      colors: [Colors.indigo, Colors.blueGrey],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )),
    child: child,
  );
}
