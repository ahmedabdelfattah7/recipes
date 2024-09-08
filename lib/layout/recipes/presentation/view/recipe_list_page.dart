import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadmon/core/service/service_locator.dart';
import 'package:tadmon/core/utils/colors.dart';
import 'package:tadmon/core/utils/enums.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_events.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_states.dart';
import 'package:tadmon/layout/recipes/presentation/view/recipe_details_page.dart';
import 'package:tadmon/layout/recipes/presentation/view/widgets/recipe_list.dart';

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipes',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorCode.titleblack,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<RecipeBloc>()..add(FetchRecipesEvent()),
        child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state.recipeRequestState == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.recipeRequestState == RequestState.loaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: GestureDetector(
                  onTap: () {},
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount: state.recipeList.length,
                      itemBuilder: (context, index) {
                        final recipes = state.recipeList[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RecipeDetailScreen(
                                            recipe: recipes)),
                              );
                            },
                            child: RecipeListWidget(recipe: recipes));
                      }),
                ),
              );
            } else if (state.recipeRequestState == RequestState.error) {
              return Center(child: Text(state.recipeMassage));
            } else {
              return const Center(child: Text('No recipes found.'));
            }
          },
        ),
      ),
    );
  }
}
