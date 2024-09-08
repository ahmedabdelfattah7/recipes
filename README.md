# tadmon

Recipe App Overview
This Flutter Recipe App demonstrates user authentication, recipe fetching, and local storage using flutter_bloc for state management and Clean Architecture principles.

Key Features
User Login:

Simple login screen with hardcoded credentials (admin@example.com / password123) managed by RecipeLoginCubit.
Password visibility toggle for better user experience.
Recipe List with Favorites:

Fetches recipes from a remote API using Dio and displays them in a list.
Users can mark recipes as favorites. Favorites are managed locally with sqflite.
State Management with Bloc:

RecipeLoginCubit handles authentication states.
RecipeBloc manages recipe fetching and favorite toggling.
Clean Architecture:

Separates code into Data, Domain, and Presentation layers for maintainability.
