import 'package:dartz/dartz.dart';
import 'package:tadmon/core/error/exceptions.dart';
import 'package:tadmon/core/error/failure.dart';
import 'package:tadmon/layout/recipes/data/data_source/recipe_data_source.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe_details.dart';
import 'package:tadmon/layout/recipes/domain/repository/base_recipe_repository.dart';
import 'package:tadmon/layout/recipes/domain/usecases/get_recipe_details_usecase.dart';

class RecipeRepository extends BaseRecipeRepository {
final BaseRecipeRemoteDataSource baseRecipeRemoteDataSource;

  RecipeRepository( this.baseRecipeRemoteDataSource);

  @override
  Future<Either<Failure, RecipeDetail>> getRecipeDetail(RecipeDetailParams params) async {
    final result = await baseRecipeRemoteDataSource.getRecipeDetail(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> getRecipes() async {
    final result = await baseRecipeRemoteDataSource.getRecipes();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

}
