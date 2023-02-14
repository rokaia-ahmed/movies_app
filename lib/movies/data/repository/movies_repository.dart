import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../../../core/error/failure.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepository{
 final BaseMovieRemoteDataSource  baseMovieRemoteDataSource;
 MoviesRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies()async {
     final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies()async {
    final result= await baseMovieRemoteDataSource.getPopularMovie();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies()async {
    final result= await baseMovieRemoteDataSource.getRatedMovie();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}