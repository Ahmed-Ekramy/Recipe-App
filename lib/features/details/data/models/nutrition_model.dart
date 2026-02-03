import 'dart:convert';

NutritionResponseModel nutritionResponseModelFromJson(String str) =>
    NutritionResponseModel.fromJson(json.decode(str));

String nutritionResponseModelToJson(NutritionResponseModel data) =>
    json.encode(data.toJson());

class NutritionResponseModel {
  String? calories;
  String? carbs;
  String? fat;
  String? protein;
  List<Bad>? bad;
  List<Bad>? good;
  List<Flavonoid>? nutrients;
  List<Flavonoid>? properties;
  List<Flavonoid>? flavonoids;
  List<Ingredient>? ingredients;
  CaloricBreakdown? caloricBreakdown;
  WeightPerServing? weightPerServing;
  int? expires;
  bool? stale;

  NutritionResponseModel({
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
    this.bad,
    this.good,
    this.nutrients,
    this.properties,
    this.flavonoids,
    this.ingredients,
    this.caloricBreakdown,
    this.weightPerServing,
    this.expires,
    this.stale,
  });

  int get caloriesInt => int.tryParse(calories?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0') ?? 0;
  int get carbsInt => int.tryParse(carbs?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0') ?? 0;
  int get fatInt => int.tryParse(fat?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0') ?? 0;
  int get proteinInt => int.tryParse(protein?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0') ?? 0;

  factory NutritionResponseModel.fromJson(Map<String, dynamic> json) =>
      NutritionResponseModel(
        calories: json["calories"],
        carbs: json["carbs"],
        fat: json["fat"],
        protein: json["protein"],
        bad: json["bad"] == null
            ? []
            : List<Bad>.from(json["bad"]!.map((x) => Bad.fromJson(x))),
        good: json["good"] == null
            ? []
            : List<Bad>.from(json["good"]!.map((x) => Bad.fromJson(x))),
        nutrients: json["nutrients"] == null
            ? []
            : List<Flavonoid>.from(
                json["nutrients"]!.map((x) => Flavonoid.fromJson(x)),
              ),
        properties: json["properties"] == null
            ? []
            : List<Flavonoid>.from(
                json["properties"]!.map((x) => Flavonoid.fromJson(x)),
              ),
        flavonoids: json["flavonoids"] == null
            ? []
            : List<Flavonoid>.from(
                json["flavonoids"]!.map((x) => Flavonoid.fromJson(x)),
              ),
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(
                json["ingredients"]!.map((x) => Ingredient.fromJson(x)),
              ),
        caloricBreakdown: json["caloricBreakdown"] == null
            ? null
            : CaloricBreakdown.fromJson(json["caloricBreakdown"]),
        weightPerServing: json["weightPerServing"] == null
            ? null
            : WeightPerServing.fromJson(json["weightPerServing"]),
        expires: json["expires"],
        stale: json["stale"],
      );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "carbs": carbs,
    "fat": fat,
    "protein": protein,
    "bad": bad == null ? [] : List<dynamic>.from(bad!.map((x) => x.toJson())),
    "good": good == null
        ? []
        : List<dynamic>.from(good!.map((x) => x.toJson())),
    "nutrients": nutrients == null
        ? []
        : List<dynamic>.from(nutrients!.map((x) => x.toJson())),
    "properties": properties == null
        ? []
        : List<dynamic>.from(properties!.map((x) => x.toJson())),
    "flavonoids": flavonoids == null
        ? []
        : List<dynamic>.from(flavonoids!.map((x) => x.toJson())),
    "ingredients": ingredients == null
        ? []
        : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
    "caloricBreakdown": caloricBreakdown?.toJson(),
    "weightPerServing": weightPerServing?.toJson(),
    "expires": expires,
    "stale": stale,
  };
}

class Bad {
  String? title;
  String? amount;
  bool? indented;
  double? percentOfDailyNeeds;

  Bad({this.title, this.amount, this.indented, this.percentOfDailyNeeds});

  factory Bad.fromJson(Map<String, dynamic> json) => Bad(
    title: json["title"],
    amount: json["amount"],
    indented: json["indented"],
    percentOfDailyNeeds: json["percentOfDailyNeeds"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "amount": amount,
    "indented": indented,
    "percentOfDailyNeeds": percentOfDailyNeeds,
  };
}

class CaloricBreakdown {
  double? percentProtein;
  double? percentFat;
  double? percentCarbs;

  CaloricBreakdown({this.percentProtein, this.percentFat, this.percentCarbs});

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) =>
      CaloricBreakdown(
        percentProtein: json["percentProtein"]?.toDouble(),
        percentFat: json["percentFat"]?.toDouble(),
        percentCarbs: json["percentCarbs"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "percentProtein": percentProtein,
    "percentFat": percentFat,
    "percentCarbs": percentCarbs,
  };
}

class Flavonoid {
  String? name;
  double? amount;
  String? unit;
  double? percentOfDailyNeeds;

  Flavonoid({this.name, this.amount, this.unit, this.percentOfDailyNeeds});

  factory Flavonoid.fromJson(Map<String, dynamic> json) => Flavonoid(
    name: json["name"],
    amount: json["amount"]?.toDouble(),
    unit: json["unit"],
    percentOfDailyNeeds: json["percentOfDailyNeeds"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
    "unit": unit,
    "percentOfDailyNeeds": percentOfDailyNeeds,
  };
}

class Ingredient {
  int? id;
  String? name;
  double? amount;
  String? unit;
  List<Flavonoid>? nutrients;

  Ingredient({this.id, this.name, this.amount, this.unit, this.nutrients});

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    id: json["id"],
    name: json["name"],
    amount: json["amount"]?.toDouble(),
    unit: json["unit"],
    nutrients: json["nutrients"] == null
        ? []
        : List<Flavonoid>.from(
            json["nutrients"]!.map((x) => Flavonoid.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "amount": amount,
    "unit": unit,
    "nutrients": nutrients == null
        ? []
        : List<dynamic>.from(nutrients!.map((x) => x.toJson())),
  };
}

class WeightPerServing {
  int? amount;
  String? unit;

  WeightPerServing({this.amount, this.unit});

  factory WeightPerServing.fromJson(Map<String, dynamic> json) =>
      WeightPerServing(amount: json["amount"], unit: json["unit"]);

  Map<String, dynamic> toJson() => {"amount": amount, "unit": unit};
}
