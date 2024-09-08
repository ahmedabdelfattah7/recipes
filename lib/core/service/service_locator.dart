import 'package:get_it/get_it.dart';
import 'package:tadmon/layout/recipes/data/data_source/local_data_base_helper.dart';
import 'package:tadmon/layout/recipes/data/data_source/recipe_data_source.dart';
import 'package:tadmon/layout/recipes/data/repository/recipe_repository.dart';
import 'package:tadmon/layout/recipes/domain/repository/base_recipe_repository.dart';
import 'package:tadmon/layout/recipes/domain/usecases/get_recipe_usecase.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() async {
    /// Initialize Local Database Helper
    final RecipeLocalDataSource recipeLocalDataSource = RecipeLocalDataSource.instance;

    /// Register Local Data Source with GetIt
    sl.registerLazySingleton<RecipeLocalDataSource>(() => recipeLocalDataSource);

    /// Blocs
    sl.registerFactory(
          () => RecipeBloc(sl(), sl()),
    );

    /// Repository
    sl.registerLazySingleton<BaseRecipeRepository>(
          () => RecipeRepository(sl()),
    );

    /// Remote Data Source
    sl.registerLazySingleton<BaseRecipeRemoteDataSource>(
          () => RecipeRemoteDataSourceImpl(),
    );

    /// UseCase Injection
    sl.registerLazySingleton(
          () => GetRecipesUseCase(sl()),
    );
  }
}
