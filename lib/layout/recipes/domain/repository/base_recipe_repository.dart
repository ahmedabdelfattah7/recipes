import 'package:dartz/dartz.dart';
import 'package:tadmon/core/error/failure.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe_details.dart';
import '../usecases/get_recipe_details_usecase.dart';

abstract class BaseRecipeRepository {
  Future<Either<Failure, List<Recipe>>> getRecipes();
  Future<Either<Failure, RecipeDetail>> getRecipeDetail(RecipeDetailParams params);
}