import 'package:tadmon/layout/recipes/domain/entities/recipe_details.dart';

class RecipeDetailModel extends RecipeDetail {
  const RecipeDetailModel({
    required super.id,
    required super.fats,
    required super.name,
    required super.time,
    required super.image,
    required super.weeks,
    required super.carbos,
    required super.fibers,
    super.rating,
    required super.country,
    super.ratings,
    required super.calories,
    required super.headline,
    required super.keywords,
    required super.products,
    required super.proteins,
    required super.favorites,
    required super.difficulty,
    required super.description,
    required super.highlighted,
    required super.ingredients,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) =>
      RecipeDetailModel(
        id: json['id'],
        fats: json['fats'] ?? '',
        name: json['name'],
        time: json['time'],
        image: json['image'],
        weeks: List<String>.from(json['weeks'] ?? []),
        carbos: json['carbos'] ?? '',
        fibers: json['fibers'] ?? '',
        rating: json['rating'] != null ? json['rating'].toDouble() : null,
        country: json['country'],
        ratings: json['ratings'],
        calories: json['calories'] ?? '',
        headline: json['headline'] ?? '',
        keywords: List<String>.from(json['keywords'] ?? []),
        products: List<String>.from(json['products'] ?? []),
        proteins: json['proteins'] ?? '',
        favorites: json['favorites'] ?? 0,
        difficulty: json['difficulty'] ?? 0,
        description: json['description'] ?? '',
        highlighted: json['highlighted'] ?? false,
        ingredients: List<String>.from(json['ingredients'] ?? []),
      );
}
