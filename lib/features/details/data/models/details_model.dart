
import 'dart:convert';

DetailsResponseModel detailsResponseModelFromJson(String str) => DetailsResponseModel.fromJson(json.decode(str));

String detailsResponseModelToJson(DetailsResponseModel data) => json.encode(data.toJson());

class DetailsResponseModel {
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? servings;
  int? readyInMinutes;
  int? cookingMinutes;
  int? preparationMinutes;
  String? license;
  String? sourceName;
  String? sourceUrl;
  String? spoonacularSourceUrl;
  num? healthScore;
  num? spoonacularScore;
  double? pricePerServing;
  List<AnalyzedInstruction>? analyzedInstructions;
  bool? cheap;
  String? creditsText;
  List<dynamic>? cuisines;
  bool? dairyFree;
  List<dynamic>? diets;
  String? gaps;
  bool? glutenFree;
  String? instructions;
  bool? ketogenic;
  bool? lowFodmap;
  List<dynamic>? occasions;
  bool? sustainable;
  bool? vegan;
  bool? vegetarian;
  bool? veryHealthy;
  bool? veryPopular;
  bool? whole30;
  int? weightWatcherSmartPoints;
  List<String>? dishTypes;
  List<ExtendedIngredient>? extendedIngredients;
  String? summary;
  WinePairing? winePairing;

  DetailsResponseModel({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.servings,
    this.readyInMinutes,
    this.cookingMinutes,
    this.preparationMinutes,
    this.license,
    this.sourceName,
    this.sourceUrl,
    this.spoonacularSourceUrl,
    this.healthScore,
    this.spoonacularScore,
    this.pricePerServing,
    this.analyzedInstructions,
    this.cheap,
    this.creditsText,
    this.cuisines,
    this.dairyFree,
    this.diets,
    this.gaps,
    this.glutenFree,
    this.instructions,
    this.ketogenic,
    this.lowFodmap,
    this.occasions,
    this.sustainable,
    this.vegan,
    this.vegetarian,
    this.veryHealthy,
    this.veryPopular,
    this.whole30,
    this.weightWatcherSmartPoints,
    this.dishTypes,
    this.extendedIngredients,
    this.summary,
    this.winePairing,
  });

  factory DetailsResponseModel.fromJson(Map<String, dynamic> json) => DetailsResponseModel(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    imageType: json["imageType"],
    servings: json["servings"],
    readyInMinutes: json["readyInMinutes"],
    cookingMinutes: json["cookingMinutes"],
    preparationMinutes: json["preparationMinutes"],
    license: json["license"],
    sourceName: json["sourceName"],
    sourceUrl: json["sourceUrl"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"],
    healthScore: json["healthScore"],
    spoonacularScore: json["spoonacularScore"],
    pricePerServing: json["pricePerServing"]?.toDouble(),
    analyzedInstructions: json["analyzedInstructions"] == null ? [] : List<AnalyzedInstruction>.from(json["analyzedInstructions"]!.map((x) => AnalyzedInstruction.fromJson(x))),
    cheap: json["cheap"],
    creditsText: json["creditsText"],
    cuisines: json["cuisines"] == null ? [] : List<dynamic>.from(json["cuisines"]!.map((x) => x)),
    dairyFree: json["dairyFree"],
    diets: json["diets"] == null ? [] : List<dynamic>.from(json["diets"]!.map((x) => x)),
    gaps: json["gaps"],
    glutenFree: json["glutenFree"],
    instructions: json["instructions"],
    ketogenic: json["ketogenic"],
    lowFodmap: json["lowFodmap"],
    occasions: json["occasions"] == null ? [] : List<dynamic>.from(json["occasions"]!.map((x) => x)),
    sustainable: json["sustainable"],
    vegan: json["vegan"],
    vegetarian: json["vegetarian"],
    veryHealthy: json["veryHealthy"],
    veryPopular: json["veryPopular"],
    whole30: json["whole30"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    dishTypes: json["dishTypes"] == null ? [] : List<String>.from(json["dishTypes"]!.map((x) => x)),
    extendedIngredients: json["extendedIngredients"] == null ? [] : List<ExtendedIngredient>.from(json["extendedIngredients"]!.map((x) => ExtendedIngredient.fromJson(x))),
    summary: json["summary"],
    winePairing: json["winePairing"] == null ? null : WinePairing.fromJson(json["winePairing"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "imageType": imageType,
    "servings": servings,
    "readyInMinutes": readyInMinutes,
    "cookingMinutes": cookingMinutes,
    "preparationMinutes": preparationMinutes,
    "license": license,
    "sourceName": sourceName,
    "sourceUrl": sourceUrl,
    "spoonacularSourceUrl": spoonacularSourceUrl,
    "healthScore": healthScore,
    "spoonacularScore": spoonacularScore,
    "pricePerServing": pricePerServing,
    "analyzedInstructions": analyzedInstructions == null ? [] : List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
    "cheap": cheap,
    "creditsText": creditsText,
    "cuisines": cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
    "dairyFree": dairyFree,
    "diets": diets == null ? [] : List<dynamic>.from(diets!.map((x) => x)),
    "gaps": gaps,
    "glutenFree": glutenFree,
    "instructions": instructions,
    "ketogenic": ketogenic,
    "lowFodmap": lowFodmap,
    "occasions": occasions == null ? [] : List<dynamic>.from(occasions!.map((x) => x)),
    "sustainable": sustainable,
    "vegan": vegan,
    "vegetarian": vegetarian,
    "veryHealthy": veryHealthy,
    "veryPopular": veryPopular,
    "whole30": whole30,
    "weightWatcherSmartPoints": weightWatcherSmartPoints,
    "dishTypes": dishTypes == null ? [] : List<dynamic>.from(dishTypes!.map((x) => x)),
    "extendedIngredients": extendedIngredients == null ? [] : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
    "summary": summary,
    "winePairing": winePairing?.toJson(),
  };
}

class ExtendedIngredient {
  String? aisle;
  double? amount;
  String? consistency;
  int? id;
  String? image;
  Measures? measures;
  List<String>? meta;
  String? name;
  String? original;
  String? originalName;
  String? unit;

  ExtendedIngredient({
    this.aisle,
    this.amount,
    this.consistency,
    this.id,
    this.image,
    this.measures,
    this.meta,
    this.name,
    this.original,
    this.originalName,
    this.unit,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
    aisle: json["aisle"],
    amount: json["amount"]?.toDouble(),
    consistency: json["consistency"],
    id: json["id"],
    image: json["image"],
    measures: json["measures"] == null ? null : Measures.fromJson(json["measures"]),
    meta: json["meta"] == null ? [] : List<String>.from(json["meta"]!.map((x) => x)),
    name: json["name"],
    original: json["original"],
    originalName: json["originalName"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "aisle": aisle,
    "amount": amount,
    "consistency": consistency,
    "id": id,
    "image": image,
    "measures": measures?.toJson(),
    "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
    "name": name,
    "original": original,
    "originalName": originalName,
    "unit": unit,
  };
}

class Measures {
  Metric? metric;
  Metric? us;

  Measures({
    this.metric,
    this.us,
  });

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
    metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
    us: json["us"] == null ? null : Metric.fromJson(json["us"]),
  );

  Map<String, dynamic> toJson() => {
    "metric": metric?.toJson(),
    "us": us?.toJson(),
  };
}

class Metric {
  double? amount;
  String? unitLong;
  String? unitShort;

  Metric({
    this.amount,
    this.unitLong,
    this.unitShort,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
    amount: json["amount"]?.toDouble(),
    unitLong: json["unitLong"],
    unitShort: json["unitShort"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unitLong": unitLong,
    "unitShort": unitShort,
  };
}

class WinePairing {
  List<String>? pairedWines;
  String? pairingText;
  List<ProductMatch>? productMatches;

  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
    pairedWines: json["pairedWines"] == null ? [] : List<String>.from(json["pairedWines"]!.map((x) => x)),
    pairingText: json["pairingText"],
    productMatches: json["productMatches"] == null ? [] : List<ProductMatch>.from(json["productMatches"]!.map((x) => ProductMatch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pairedWines": pairedWines == null ? [] : List<dynamic>.from(pairedWines!.map((x) => x)),
    "pairingText": pairingText,
    "productMatches": productMatches == null ? [] : List<dynamic>.from(productMatches!.map((x) => x.toJson())),
  };
}

class ProductMatch {
  int? id;
  String? title;
  String? description;
  String? price;
  String? imageUrl;
  double? averageRating;
  int? ratingCount;
  double? score;
  String? link;

  ProductMatch({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.averageRating,
    this.ratingCount,
    this.score,
    this.link,
  });

  factory ProductMatch.fromJson(Map<String, dynamic> json) => ProductMatch(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    imageUrl: json["imageUrl"],
    averageRating: json["averageRating"]?.toDouble(),
    ratingCount: json["ratingCount"],
    score: json["score"]?.toDouble(),
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "imageUrl": imageUrl,
    "averageRating": averageRating,
    "ratingCount": ratingCount,
    "score": score,
    "link": link,
  };
}

class AnalyzedInstruction {
  String? name;
  List<InstructionStep>? steps;

  AnalyzedInstruction({this.name, this.steps});

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
    name: json["name"],
    steps: json["steps"] == null ? [] : List<InstructionStep>.from(json["steps"]!.map((x) => InstructionStep.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x.toJson())),
  };
}

class InstructionStep {
  int? number;
  String? step;
  List<StepIngredient>? ingredients;
  List<StepEquipment>? equipment;
  StepLength? length;

  InstructionStep({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  factory InstructionStep.fromJson(Map<String, dynamic> json) => InstructionStep(
        number: json["number"],
        step: json["step"],
        ingredients: json["ingredients"] == null
            ? []
            : List<StepIngredient>.from(
                json["ingredients"]!.map((x) => StepIngredient.fromJson(x))),
        equipment: json["equipment"] == null
            ? []
            : List<StepEquipment>.from(
                json["equipment"]!.map((x) => StepEquipment.fromJson(x))),
        length: json["length"] == null ? null : StepLength.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "equipment": equipment == null
            ? []
            : List<dynamic>.from(equipment!.map((x) => x.toJson())),
        "length": length?.toJson(),
      };
}

class StepIngredient {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  StepIngredient({this.id, this.name, this.localizedName, this.image});

  factory StepIngredient.fromJson(Map<String, dynamic> json) => StepIngredient(
        id: json["id"],
        name: json["name"],
        localizedName: json["localizedName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localizedName": localizedName,
        "image": image,
      };
}

class StepEquipment {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  StepEquipment({this.id, this.name, this.localizedName, this.image});

  factory StepEquipment.fromJson(Map<String, dynamic> json) => StepEquipment(
        id: json["id"],
        name: json["name"],
        localizedName: json["localizedName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localizedName": localizedName,
        "image": image,
      };
}

class StepLength {
  int? number;
  String? unit;

  StepLength({this.number, this.unit});

  factory StepLength.fromJson(Map<String, dynamic> json) => StepLength(
        number: json["number"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "unit": unit,
      };
}
