import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_models.dart';

import '../../../core/network/api_constance.dart';
abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModels>> getNowPlayingMovies();
  Future<List<MovieModels>> getPopularMovie();
  Future<List<MovieModels>> getRatedMovie();
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
 @override
  Future<List<MovieModels>> getNowPlayingMovies()async{
  final response =  await Dio().get(
      ApiConstance.nowPlayingMoviePath);
    if(response.statusCode==200){
      return List<MovieModels>.from(
          (response.data["results"] as List)
              .map((e) => MovieModels.fromJson(e))
      );
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModels>> getPopularMovie() async{
    final response =  await Dio().get(ApiConstance.popularMoviePath);
    if(response.statusCode==200){
      return List<MovieModels>.from(
          (response.data["results"] as List)
              .map((e) => MovieModels.fromJson(e))
      );
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModels>> getRatedMovie() async{
    final response =  await Dio().get(ApiConstance.topRatedPath);
    if(response.statusCode==200){
      return List<MovieModels>.from(
          (response.data["results"] as List)
              .map((e) => MovieModels.fromJson(e))
      );
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}