import 'package:equatable/equatable.dart';
import 'package:tadmon/core/utils/enums.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';

class RecipeState extends Equatable {
  final List<Recipe> recipeList;
  final RequestState recipeRequestState;
  final String recipeMassage;
  const RecipeState({
    this.recipeList = const [],
    this.recipeRequestState = RequestState.loading,
    this.recipeMassage = '',
  });

  RecipeState copyWith({
    List<Recipe>? recipeList,
    RequestState? recipeRequestState,
    String? recipeMassage,
  }) {
    return RecipeState(
        recipeList: recipeList ?? this.recipeList,
      recipeRequestState: recipeRequestState ?? this.recipeRequestState,
      recipeMassage: recipeMassage ?? this.recipeMassage
    );
  }

  @override
  List<Object?> get props => [
    recipeList,
    recipeRequestState,
    recipeMassage,
  ];
}
