class BuildingsModel {
  int id;
  String buildingName;

  BuildingsModel({
    required this.id,
    required this.buildingName,
  });

  factory BuildingsModel.fromJson(Map<dynamic, dynamic> json) => BuildingsModel(
        id: json["id"],
        buildingName: json["buildingName"],
      );
}
