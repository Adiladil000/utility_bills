import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../model/buildings_model.dart';
import '../screens/buildings_screen.dart';

Future<List<BuildingsModel>> getBuildingsData() async {
  try {
    final url = '$BASE_URL/buildings';
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    for (Map i in data) {
      buildingsdataList.add(BuildingsModel.fromJson(i));
      if (buildingsdataList.isEmpty) {
        buildingsdataList.add(BuildingsModel.fromJson(i));
      }
    }
    return buildingsdataList;
  } catch (e) {
    if (e is SocketException) {
      print("Socket exception");
    } else {
      print("Unhandled exception: ${e.toString()}");
    }
  }
  return buildingsdataList;
}
