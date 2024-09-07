import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  const RecipeModel({
    required String id,
    required String name,
    required String image,
    required String headline,
  }) : super(
    id: id,
    name: name,
    image: image,
    headline: headline,
  );

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      headline: json['headline'],
    );
  }
}

