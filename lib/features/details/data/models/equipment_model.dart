

import 'dart:convert';

EquipmentResponseModel equipmentResponseModelFromJson(String str) => EquipmentResponseModel.fromJson(json.decode(str));

String equipmentResponseModelToJson(EquipmentResponseModel data) => json.encode(data.toJson());

class EquipmentResponseModel {
  List<Equipment>? equipment;

  EquipmentResponseModel({
    this.equipment,
  });

  factory EquipmentResponseModel.fromJson(Map<String, dynamic> json) => EquipmentResponseModel(
    equipment: json["equipment"] == null ? [] : List<Equipment>.from(json["equipment"]!.map((x) => Equipment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "equipment": equipment == null ? [] : List<dynamic>.from(equipment!.map((x) => x.toJson())),
  };
}

class Equipment {
  String? image;
  String? name;

  Equipment({
    this.image,
    this.name,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
  };
}
