import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/controllers/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{
  final GetNowPlayingUseCase getNowPlayingUseCase;
  MoviesBloc(this.getNowPlayingUseCase): super(const MoviesState()) {
   on<NowPlayingMoviesEvent>((event, emit)async{


    final result = await getNowPlayingUseCase.execute();
     result.fold(
             (l) => emit(MoviesState(
                 nowPlayingState: RequestState.error,
                  nowPlayingMessage: l.message,
             )),
             (r) => emit(MoviesState(
             nowPlayingState: RequestState.loaded,
             nowPlayingMovies: r,
     )),
     );
   });
  }

}