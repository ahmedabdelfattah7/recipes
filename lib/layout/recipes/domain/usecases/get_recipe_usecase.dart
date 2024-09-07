import 'package:dartz/dartz.dart';
import 'package:tadmon/core/error/failure.dart';
import 'package:tadmon/core/usecase/base_use_case.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';
import 'package:tadmon/layout/recipes/domain/repository/base_recipe_repository.dart';

class GetRecipesUseCase extends BaseUseCase<List<Recipe>, NoParameters> {
  final BaseRecipeRepository baseRecipeRepository;

  GetRecipesUseCase(this.baseRecipeRepository);

  @override
  Future<Either<Failure, List<Recipe>>> call(NoParameters parameters) async {
    return await baseRecipeRepository.getRecipes();
  }
}