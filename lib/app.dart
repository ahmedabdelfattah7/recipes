
import 'package:flutter/material.dart';
import 'package:tadmon/layout/recipes/presentation/view/recipe_list_page.dart';
class TadamonTask extends StatelessWidget {
  const TadamonTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  RecipeListPage(),
    );
  }
}