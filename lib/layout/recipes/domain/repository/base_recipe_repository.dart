import 'package:dartz/dartz.dart';
import 'package:tadmon/core/error/failure.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';


abstract class BaseRecipeRepository {
  Future<Either<Failure, List<Recipe>>> getRecipes();
}