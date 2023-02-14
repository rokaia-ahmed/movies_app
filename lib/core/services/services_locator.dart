import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';
final sl = GetIt.instance;
class ServicesLocator{
  void init(){
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    ///USE CASES
    sl.registerLazySingleton(
            () => GetNowPlayingUseCase(sl()));
    ///REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(
            () => MoviesRepository(sl()));
    ///DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
            () => MovieRemoteDataSource());
  }
}