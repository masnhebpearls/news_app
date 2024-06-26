import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news_app/features/screens/home_page/data/server_data/api_methods.dart';

import '../../models/news_model/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final List<NewsModel> news= [];

  NewsBloc() : super(NewsInitial()) {
    on<ApiRequestEvent>(apiRequestEvent);

  }

  FutureOr<void> apiRequestEvent(ApiRequestEvent event, Emitter<NewsState> emit) async {
      try{
        print("here");
        final response = await ApiMethods().getData() as Map<String, dynamic>;

        for (var x in response['articles']){
          try{
            news.add(NewsModel.fromJson(x));
            print("added");
          }catch(e){
            print(e);
          }

        }
        emit(NewsLoadedState(news: news));

      }
      catch(e){
        print("here error");
        print(e);

      }

  }
}
