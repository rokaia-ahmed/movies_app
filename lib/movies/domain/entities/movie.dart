import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;
  final String overview;

const  Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
});

  @override
  List<Object> get props =>
      [id, title, backdropPath, genreIds, voteAverage, overview,releaseDate];
}