import 'package:equatable/equatable.dart';


class Recipe extends Equatable {
  final String id;
  final String name;
  final String image;
  final String headline;
  final String fats;
  final String carbs;
  final String fibers;
  final double? rating;
  final String country;
  final int? ratings;
  final String calories;
  final List<String> keywords;
  final List<String> products;
  final String proteins;
  final int favorites;
  final int difficulty;
  final String description;
  final bool highlighted;
  final List<String> ingredients;
  final String time;
  final List<String> weeks;
  final List<String> deliverableIngredients;
  final List<String> undeliverableIngredients;

  const Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.headline,
    required this.fats,
    required this.carbs,
    required this.fibers,
    this.rating,
    required this.country,
    this.ratings,
    required this.calories,
    required this.keywords,
    required this.products,
    required this.proteins,
    required this.favorites,
    required this.difficulty,
    required this.description,
    required this.highlighted,
    required this.ingredients,
    required this.time,
    required this.weeks,
    required this.deliverableIngredients,
    required this.undeliverableIngredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
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
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    headline,
    fats,
    carbs,
    fibers,
    rating,
    country,
    ratings,
    calories,
    keywords,
    products,
    proteins,
    favorites,
    difficulty,
    description,
    highlighted,
    ingredients,
    time,
    weeks,
    deliverableIngredients,
    undeliverableIngredients,
  ];
}

