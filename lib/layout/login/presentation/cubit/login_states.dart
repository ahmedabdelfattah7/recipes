abstract class RecipeLoginStates {}

class RecipeLoginInitialState extends RecipeLoginStates {}

class RecipeLoginLoadingState extends RecipeLoginStates {}

class RecipeLoginSuccessState extends RecipeLoginStates {
  final RecipeLoginModel loginModel;

  RecipeLoginSuccessState(this.loginModel);
}

class RecipeLoginErrorState extends RecipeLoginStates {
  final String error;

  RecipeLoginErrorState(this.error);
}

class RecipeChangePasswordVisibilityState extends RecipeLoginStates {}

class RecipeLoginModel {
  final String email;

  RecipeLoginModel({required this.email});

  factory RecipeLoginModel.fromJson(Map<String, dynamic> json) {
    return RecipeLoginModel(
      email: json['email'],
    );
  }
}
