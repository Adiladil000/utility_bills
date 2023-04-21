import 'package:flutter/material.dart';

import '../constants/text_stayls.dart';

class CustomElevationButtonWidgets extends StatelessWidget {
  CustomElevationButtonWidgets({super.key, required this.text, required this.onPressed});
  String text;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.home_work_sharp),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(191, 21, 82, 237),
        shape: const StadiumBorder(),
        minimumSize: Size(
          MediaQuery.of(context).size.width * 2.5 / 4,
          MediaQuery.of(context).size.height * 1 / 13,
        ),
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
