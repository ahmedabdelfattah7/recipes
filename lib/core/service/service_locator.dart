import 'package:get_it/get_it.dart';
import 'package:tadmon/layout/recipes/data/data_source/recipe_data_source.dart';
import 'package:tadmon/layout/recipes/data/repository/recipe_repository.dart';
import 'package:tadmon/layout/recipes/domain/repository/base_recipe_repository.dart';
import 'package:tadmon/layout/recipes/domain/usecases/get_recipe_details_usecase.dart';
import 'package:tadmon/layout/recipes/domain/usecases/get_recipe_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Repository
    sl.registerLazySingleton<BaseRecipeRepository>(
        () => RecipeRepository(sl()));

    ///DataSource
    sl.registerLazySingleton<BaseRecipeRemoteDataSource>(
        () => RecipeRemoteDataSourceImpl());

    ///useCase Injection
    sl.registerLazySingleton(() => GetRecipesUseCase(sl()));
    sl.registerLazySingleton(() => GetRecipeDetailUseCase(sl()));
  }
}
