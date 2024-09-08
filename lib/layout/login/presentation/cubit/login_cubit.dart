import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadmon/layout/login/presentation/cubit/login_states.dart';


class RecipeLoginCubit extends Cubit<RecipeLoginStates> {
  RecipeLoginCubit() : super(RecipeLoginInitialState());

  static RecipeLoginCubit get(context) => BlocProvider.of(context);

  final String _validEmail = "admin@example.com"; // Hardcoded valid email
  final String _validPassword = "password123"; // Hardcoded valid password

  // Visibility Toggle Variables
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(RecipeLoginLoadingState());

    // Simulate a delay for the login process
    Future.delayed(Duration(seconds: 1), () {
      if (email == _validEmail && password == _validPassword) {
        final loginModel = RecipeLoginModel(email: email);
        emit(RecipeLoginSuccessState(loginModel));
      } else {
        emit(RecipeLoginErrorState("Invalid email or password"));
      }
    });
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RecipeChangePasswordVisibilityState());
  }
}

