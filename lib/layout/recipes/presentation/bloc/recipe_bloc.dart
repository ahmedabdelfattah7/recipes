import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadmon/core/usecase/base_use_case.dart';
import 'package:tadmon/core/utils/enums.dart';
import 'package:tadmon/layout/recipes/data/data_source/local_data_base_helper.dart';
import 'package:tadmon/layout/recipes/domain/usecases/get_recipe_usecase.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_events.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_states.dart';


class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final GetRecipesUseCase getRecipesUseCase;
  final RecipeLocalDataSource recipeLocalDataSource;

  RecipeBloc(this.getRecipesUseCase, this.recipeLocalDataSource) : super(const RecipeState()) {
    on<FetchRecipesEvent>((event, emit) async {
      final result = await getRecipesUseCase(const NoParameters());
      result.fold(
            (l) => emit(
          state.copyWith(
            recipeRequestState: RequestState.error,
            recipeMassage: l.message,
          ),
        ),
            (r) => emit(
          state.copyWith(
            recipeRequestState: RequestState.loaded,
            recipeList: r,
          ),
        ),
      );
    });

    on<ToggleFavoriteEvent>((event, emit) async {
      final recipeId = event.recipe.id;
      final currentStatus = state.favoriteStatus[recipeId] ?? false;
      final newStatus = !currentStatus;
      await recipeLocalDataSource.updateFavoriteStatus(recipeId, newStatus);
      final isFavorite = await recipeLocalDataSource.isFavorite(recipeId);
      final updatedFavoriteStatus = Map<String, bool>.from(state.favoriteStatus);
      updatedFavoriteStatus[recipeId] = isFavorite;
      emit(state.copyWith(
        favoriteStatus: updatedFavoriteStatus,
      ));
    });

    // Handle the new event to load favorite status from local storage
    on<LoadFavoriteStatusEvent>((event, emit) async {
      final recipeId = event.recipe.id;
      final isFavorite = await recipeLocalDataSource.isFavorite(recipeId);
      final updatedFavoriteStatus = Map<String, bool>.from(state.favoriteStatus);
      updatedFavoriteStatus[recipeId] = isFavorite;
      emit(state.copyWith(
        favoriteStatus: updatedFavoriteStatus,
      ));
    });
  }
}




