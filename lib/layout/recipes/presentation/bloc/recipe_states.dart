import 'package:equatable/equatable.dart';
import 'package:tadmon/core/utils/enums.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';

class RecipeState extends Equatable {
  final List<Recipe> recipeList;
  final RequestState recipeRequestState;
  final String recipeMassage;
  final Map<String, bool> favoriteStatus; // Add favorite status map

  const RecipeState({
    this.recipeList = const [],
    this.recipeRequestState = RequestState.loading,
    this.recipeMassage = '',
    this.favoriteStatus = const {},
  });

  RecipeState copyWith({
    List<Recipe>? recipeList,
    RequestState? recipeRequestState,
    String? recipeMassage,
    Map<String, bool>? favoriteStatus, // Add copyWith for favorite status
  }) {
    return RecipeState(
      recipeList: recipeList ?? this.recipeList,
      recipeRequestState: recipeRequestState ?? this.recipeRequestState,
      recipeMassage: recipeMassage ?? this.recipeMassage,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
    );
  }

  @override
  List<Object?> get props => [
    recipeList,
    recipeRequestState,
    recipeMassage,
    favoriteStatus,
  ];
}
