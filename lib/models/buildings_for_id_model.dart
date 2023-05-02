class BuildingsForIdModel {
  int id;
  int buildingId;
  String buildingName;
  String ownerHouseName;
  int gasDebt;
  int lightDebt;
  int waterDebt;

  BuildingsForIdModel(
      {required this.id,
      required this.buildingId,
      required this.buildingName,
      required this.ownerHouseName,
      required this.gasDebt,
      required this.lightDebt,
      required this.waterDebt});

  factory BuildingsForIdModel.fromJson(Map<dynamic, dynamic> json) => BuildingsForIdModel(
      id: json['id'],
      buildingId: json["buildingId"],
      buildingName: json["buildingName"],
      ownerHouseName: json["ownerHouseName"],
      gasDebt: json['gasDebt'],
      lightDebt: json['lightDebt'],
      waterDebt: json['waterDebt']);
}
