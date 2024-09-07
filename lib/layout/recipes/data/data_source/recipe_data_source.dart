import 'package:dio/dio.dart';
import 'package:tadmon/core/error/exceptions.dart';
import 'package:tadmon/core/network/api_constats.dart';
import 'package:tadmon/core/network/error_massage_model.dart';
import 'package:tadmon/layout/recipes/data/models/recipe_details_model.dart';
import 'package:tadmon/layout/recipes/data/models/recipe_model.dart';
import 'package:tadmon/layout/recipes/domain/usecases/get_recipe_details_usecase.dart';

abstract class BaseRecipeRemoteDataSource {
  Future<List<RecipeModel>> getRecipes();
  Future<RecipeDetailModel> getRecipeDetail(RecipeDetailParams params);
}

class RecipeRemoteDataSourceImpl implements BaseRecipeRemoteDataSource {
  @override
  Future<List<RecipeModel>> getRecipes() async {
    print('Making network request to get recipes');

    final response = await Dio().get(ApiConstants.baseUrl);
    print('Response received'); // Debug print
    if (response.statusCode == 200) {
      print('Response data: ${response.data}'); // Debug print
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

  @override
  Future<RecipeDetailModel> getRecipeDetail(RecipeDetailParams params) async {
    print('Making network request to get recipe detail for: $params'); // Debug print

    final response = await Dio().get('${ApiConstants.baseUrl}/$params');
    print('Response received'); // Debug print
    if (response.statusCode == 200) {
      print('Response data: ${response.data}'); // Debug print
      return RecipeDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}

