// To parse this JSON data, do
//
//     final planModel = planModelFromJson(jsonString);

import 'dart:convert';

PlanModel planModelFromJson(String str) => PlanModel.fromJson(json.decode(str));

String planModelToJson(PlanModel data) => json.encode(data.toJson());

class PlanModel {
  Week? week;

  PlanModel({
    this.week,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
    week: json["week"] == null ? null : Week.fromJson(json["week"]),
  );

  Map<String, dynamic> toJson() => {
    "week": week?.toJson(),
  };
}

class Week {
  Day? monday;
  Day? tuesday;
  Day? wednesday;
  Day? thursday;
  Day? friday;
  Day? saturday;
  Day? sunday;

  Week({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory Week.fromJson(Map<String, dynamic> json) => Week(
    monday: json["monday"] == null ? null : Day.fromJson(json["monday"]),
    tuesday: json["tuesday"] == null ? null : Day.fromJson(json["tuesday"]),
    wednesday: json["wednesday"] == null ? null : Day.fromJson(json["wednesday"]),
    thursday: json["thursday"] == null ? null : Day.fromJson(json["thursday"]),
    friday: json["friday"] == null ? null : Day.fromJson(json["friday"]),
    saturday: json["saturday"] == null ? null : Day.fromJson(json["saturday"]),
    sunday: json["sunday"] == null ? null : Day.fromJson(json["sunday"]),
  );

  Map<String, dynamic> toJson() => {
    "monday": monday?.toJson(),
    "tuesday": tuesday?.toJson(),
    "wednesday": wednesday?.toJson(),
    "thursday": thursday?.toJson(),
    "friday": friday?.toJson(),
    "saturday": saturday?.toJson(),
    "sunday": sunday?.toJson(),
  };
}

class Day {
  List<Meal>? meals;
  Nutrients? nutrients;

  Day({
    this.meals,
    this.nutrients,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    meals: json["meals"] == null ? [] : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
    nutrients: json["nutrients"] == null ? null : Nutrients.fromJson(json["nutrients"]),
  );

  Map<String, dynamic> toJson() => {
    "meals": meals == null ? [] : List<dynamic>.from(meals!.map((x) => x.toJson())),
    "nutrients": nutrients?.toJson(),
  };
}

class Meal {
  int? id;
  String? image;
  String? imageType;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;

  Meal({
    this.id,
    this.image,
    this.imageType,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    id: json["id"],
    image: json["image"],
    imageType: json["imageType"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "imageType": imageType,
    "title": title,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
  };
}

class Nutrients {
  double? calories;
  double? protein;
  double? fat;
  double? carbohydrates;

  Nutrients({
    this.calories,
    this.protein,
    this.fat,
    this.carbohydrates,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
    calories: json["calories"]?.toDouble(),
    protein: json["protein"]?.toDouble(),
    fat: json["fat"]?.toDouble(),
    carbohydrates: json["carbohydrates"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "protein": protein,
    "fat": fat,
    "carbohydrates": carbohydrates,
  };
}
