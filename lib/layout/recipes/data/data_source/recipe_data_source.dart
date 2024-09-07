import 'package:dio/dio.dart';
import 'package:tadmon/core/error/exceptions.dart';
import 'package:tadmon/core/network/api_constats.dart';
import 'package:tadmon/core/network/error_massage_model.dart';
import 'package:tadmon/layout/recipes/data/models/recipe_model.dart';

abstract class BaseRecipeRemoteDataSource {
  Future<List<RecipeModel>> getRecipes();
}

class RecipeRemoteDataSourceImpl implements BaseRecipeRemoteDataSource {
  @override
  Future<List<RecipeModel>> getRecipes() async {
    print('Making network request to get recipes');

    final response = await Dio().get(ApiConstants.baseUrl);
    print('Response received'); // Debug print
    if (response.statusCode == 200) {
      print('Response data from recipe: ${response.data}'); // Debug print
      return List<RecipeModel>.from(
        (response.data as List).map(
              (recipeJson) => RecipeModel.fromJson(recipeJson),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}

