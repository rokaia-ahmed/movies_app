import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetPopularUseCase{
 final BaseMovieRepository baseMovieRepository;
  GetPopularUseCase(this.baseMovieRepository);

 Future<Either<Failure,List<Movie>>> execute()async{
    return await baseMovieRepository.getPopularMovies();
  }
}