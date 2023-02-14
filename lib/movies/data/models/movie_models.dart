import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModels extends Movie{
  const MovieModels({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
    required super.overview});

  factory MovieModels.fromJson(Map<String,dynamic>json)=>
      MovieModels(
          id: json["id"],
          title: json["title"],
          backdropPath: json["backdrop_path"],
          genreIds: List<int>.from(json["genre_ids"].map((e)=>e)),
          voteAverage: json["vote_average"].toDouble(),
          releaseDate: json["release_date"],
          overview: json["overview"]);

}