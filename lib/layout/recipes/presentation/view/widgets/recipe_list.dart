import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadmon/core/utils/colors.dart';
import 'package:tadmon/layout/recipes/domain/entities/recipe.dart';

class RecipeListWidget extends StatelessWidget {
 var recipe;

   RecipeListWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorCode.white,
        border: Border.all(color: ColorCode.borderGrey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Adjust radius as needed
            child: Image.network(
              recipe.image,
              fit: BoxFit.cover,
              height: 100,
              width: 150,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
// Expanded to take up remaining space
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorCode.titleblack,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    recipe.headline,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorCode.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
