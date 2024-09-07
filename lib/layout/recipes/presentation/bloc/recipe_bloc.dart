import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadmon/core/usecase/base_use_case.dart';
import 'package:tadmon/core/utils/enums.dart';
import 'package:tadmon/layout/recipes/domain/usecases/get_recipe_usecase.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_events.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_states.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final GetRecipesUseCase getRecipesUseCase;

  RecipeBloc(this.getRecipesUseCase) : super(const RecipeState()) {
    on<FetchRecipesEvent>((event, emit) async {
      final result = await getRecipesUseCase(const NoParameters());
      result.fold(
        (l) => state.copyWith(
          recipeRequestState: RequestState.error,
          recipeMassage: l.message,
        ),
        (r) => emit(
          state.copyWith(
            recipeRequestState: RequestState.loaded,
            recipeList: r,
          ),
        ),
      );
    });
  }
}
