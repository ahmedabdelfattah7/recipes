
import 'package:equatable/equatable.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object?> get props => [];
}

class FetchRecipesEvent extends RecipeEvent {}

class ToggleFavoriteEvent extends RecipeEvent {
  final Recipe recipe;

  const ToggleFavoriteEvent(this.recipe);

  @override
  List<Object?> get props => [recipe];
}
class LoadFavoriteStatusEvent extends RecipeEvent {
  final Recipe recipe;

  const LoadFavoriteStatusEvent(this.recipe);

  @override
  List<Object?> get props => [recipe];
}
