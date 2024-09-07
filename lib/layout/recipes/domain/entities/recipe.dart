import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String id;
  final String name;
  final String image;
  final String headline;

  const Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.headline,
  });

  @override
  List<Object?> get props => [id, name, image, headline];
}


