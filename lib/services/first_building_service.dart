import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/buildings_for_id_model.dart';
import '../screens/first_building_screen.dart';

Future<List<BuildingsForIdModel>> getFirstBuildingData() async {
  try {
    final url = first_building;
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    for (Map i in data) {
      firstBuildingDataList.add(BuildingsForIdModel.fromJson(i));
      if (firstBuildingDataList.isEmpty) {
        firstBuildingDataList.add(BuildingsForIdModel.fromJson(i));
      }
    }
    return firstBuildingDataList;
  } catch (e) {
    if (e is SocketException) {
      null;
    }
  }
  return firstBuildingDataList;
}
