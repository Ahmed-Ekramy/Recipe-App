class EndPoint {
  static String baseUrl = "https://api.spoonacular.com/";
  static String recipes = "recipes/random";
  static String recipesDetails ( int id) => "recipes/$id/information";
  static String recipesEquipment ( int id) => "recipes/$id/equipmentWidget.json";
  static String recipesNutrition ( int id) => "recipes/$id/nutritionWidget.json";
  static String recipesSimilar ( int id) => "recipes/$id/similar";
}
