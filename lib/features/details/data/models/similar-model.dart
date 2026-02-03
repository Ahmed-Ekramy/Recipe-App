

import 'dart:convert';

List<SimilarResponseModel> similarResponseModelFromJson(String str) => List<SimilarResponseModel>.from(json.decode(str).map((x) => SimilarResponseModel.fromJson(x)));

String similarResponseModelToJson(List<SimilarResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SimilarResponseModel {
  int? id;
  String? title;
   String ?image;
  String? imageType;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;

  SimilarResponseModel({
    this.id,
    this.title,
    this.image ,
    this.imageType,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
  });

  factory SimilarResponseModel.fromJson(Map<String, dynamic> json) => SimilarResponseModel(
    id: json["id"],
    title: json["title"],
    imageType: json["imageType"],
    image:
    "https://spoonacular.com/recipeImages/${json['id']}-556x370.${json['imageType']}",
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "imageType": imageType,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
  };
}
