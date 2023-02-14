class ApiConstance{
  static const String baseUel='https://api.themoviedb.org/3';
  static const String apiKey='216fb3883daa79f1090b1e4e021088e9';
  static const String nowPlayingMoviePath=
      '$baseUel/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath=
      '$baseUel/movie/popular?api_key=$apiKey';
  static const String topRatedPath=
      '$baseUel/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl=
      'https://image.tmdb.org/t/p/w500';

  static  String imageUrl(String path){
    return 'baseImageUrl$path';
  }
}