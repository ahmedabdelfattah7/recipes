import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';


class RecipeModel extends Recipe {
  bool isFavorite;

  RecipeModel({
    required String id,
    required String name,
    required String image,
    required String headline,
    required String fats,
    required String carbs,
    required String fibers,
    double? rating,
    required String country,
    int? ratings,
    required String calories,
    required List<String> keywords,
    required List<String> products,
    required String proteins,
    required int favorites,
    required int difficulty,
    required String description,
    required bool highlighted,
    required List<String> ingredients,
    required String time,
    required List<String> weeks,
    required List<String> deliverableIngredients,
    required List<String> undeliverableIngredients,
    this.isFavorite = false, // Initialize as not favorite by default
  }) : super(
    id: id,
    name: name,
    image: image,
    headline: headline,
    fats: fats,
    carbs: carbs,
    fibers: fibers,
    rating: rating,
    country: country,
    ratings: ratings,
    calories: calories,
    keywords: keywords,
    products: products,
    proteins: proteins,
    favorites: favorites,
    difficulty: difficulty,
    description: description,
    highlighted: highlighted,
    ingredients: ingredients,
    time: time,
    weeks: weeks,
    deliverableIngredients: deliverableIngredients,
    undeliverableIngredients: undeliverableIngredients,
  );

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      headline: json['headline'],
      fats: json['fats'] ?? '',
      carbs: json['carbos'] ?? '',
      fibers: json['fibers'] ?? '',
      rating: json['rating'] != null ? json['rating'].toDouble() : null,
      country: json['country'] ?? '',
      ratings: json['ratings'],
      calories: json['calories'] ?? '',
      keywords: List<String>.from(json['keywords'] ?? []),
      products: List<String>.from(json['products'] ?? []),
      proteins: json['proteins'] ?? '',
      favorites: json['favorites'] ?? 0,
      difficulty: json['difficulty'] ?? 0,
      description: json['description'] ?? '',
      highlighted: json['highlighted'] ?? false,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      time: json['time'] ?? '',
      weeks: List<String>.from(json['weeks'] ?? []),
      deliverableIngredients: List<String>.from(json['deliverable_ingredients'] ?? []),
      undeliverableIngredients: List<String>.from(json['undeliverable_ingredients'] ?? []),
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}



