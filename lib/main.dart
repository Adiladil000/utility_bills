import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dependency_injection.dart';
import 'screens/buildings_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const Buildingscreens(),
    );
  }
}
