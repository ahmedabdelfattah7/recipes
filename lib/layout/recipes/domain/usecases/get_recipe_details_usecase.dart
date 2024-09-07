import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadmon/core/error/failure.dart';
import 'package:tadmon/core/usecase/base_use_case.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe_details.dart';
import 'package:tadmon/layout/recipes/domain/repository/base_recipe_repository.dart';

class GetRecipeDetailUseCase extends BaseUseCase<RecipeDetail, RecipeDetailParams> {
  final BaseRecipeRepository baseRecipeRepository;

  GetRecipeDetailUseCase(this.baseRecipeRepository);

  @override
  Future<Either<Failure, RecipeDetail>> call(
      RecipeDetailParams parameters,
      ) async {
    return await baseRecipeRepository.getRecipeDetail(parameters);
  }
}



class RecipeDetailParams extends Equatable {
  final String recipeId;

  const RecipeDetailParams({required this.recipeId});

  @override
  List<Object?> get props => [recipeId];
}