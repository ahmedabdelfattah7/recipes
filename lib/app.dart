import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadmon/layout/login/presentation/view/login_screen.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:tadmon/layout/recipes/presentation/view/recipe_list_page.dart';

import 'core/service/service_locator.dart';
class RecipeTask extends StatelessWidget {
  const RecipeTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}