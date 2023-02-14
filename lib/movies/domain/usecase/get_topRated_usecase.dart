import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedUseCase{
final BaseMovieRepository baseMovieRepository;

GetTopRatedUseCase(this.baseMovieRepository);
Future<Either<Failure,List<Movie>>> execute()async{
  return await baseMovieRepository.getTopRatedMovies();
}
}