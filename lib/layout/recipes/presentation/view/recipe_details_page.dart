import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadmon/core/service/service_locator.dart';
import 'package:tadmon/core/utils/colors.dart';
import 'package:tadmon/core/utils/enums.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_events.dart';
import 'package:tadmon/layout/recipes/presentation/bloc/recipe_states.dart';

class RecipeDetailScreen extends StatelessWidget {
  var recipe;

   RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: BlocProvider(
        create: (context) => sl<RecipeBloc>()..add(FetchRecipesEvent()),
    child: BlocBuilder<RecipeBloc, RecipeState>(
    builder: (context, state) {
            switch (state.recipeRequestState) {
              case RequestState.loading:
                return const SizedBox(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              case RequestState.loaded:
                return CustomScrollView(
                  key: const Key('recipeDetailScrollView'),
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: FadeIn(
                          duration: const Duration(milliseconds: 500),
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0.0, 0.5, 1.0, 1.0],
                              ).createShader(
                                Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: Image.network(
                              recipe.image,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      recipe.calories,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        recipe.rating?.toStringAsFixed(1) ?? 'N/A',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                    ],
                                  ),
                                  const SizedBox(width: 16.0),
                                  Text(
                                    '${recipe.time} mins',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                recipe.description,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Ingredients: ${recipe!.ingredients.join(", ")}',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Add more sections here, similar to 'More like this' in MovieDetailContent
                  ],
                );

              case RequestState.error:
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      state.recipeMassage,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );

              default:
                return const SizedBox.shrink();
            }
          },
        ),
        ),
    );
  }
}

