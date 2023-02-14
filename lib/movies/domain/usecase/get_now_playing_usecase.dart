import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../../../core/error/failure.dart';
import '../repository/base_movie_repository.dart';

class GetNowPlayingUseCase{
final BaseMovieRepository baseMovieRepository;

  GetNowPlayingUseCase(this.baseMovieRepository);

Future<Either<Failure,List<Movie>>> execute()async{
    return await baseMovieRepository.getNowPlayingMovies();
  }
}