
import 'dart:convert';

List<AutocompleteResponseModel> autocompleteResponseModelFromJson(String str) => List<AutocompleteResponseModel>.from(json.decode(str).map((x) => AutocompleteResponseModel.fromJson(x)));

class AutocompleteResponseModel {
  int? id;
  String? title;
  String? imageType;

  AutocompleteResponseModel({
    this.id,
    this.title,
    this.imageType,
  });

  factory AutocompleteResponseModel.fromJson(Map<String, dynamic> json) => AutocompleteResponseModel(
    id: json["id"],
    title: json["title"],
    imageType: json["imageType"],
  );

}
