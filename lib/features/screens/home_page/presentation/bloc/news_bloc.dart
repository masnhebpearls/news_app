import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:news_app/features/screens/home_page/data/local_data/database_methods.dart';
import 'package:news_app/features/screens/home_page/data/server_data/api_methods.dart';
import '../../models/news_model/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final List<NewsModel> news = [];
  final List<NewsModel> hiveSavedNews = [];

  NewsBloc() : super(NewsInitial()) {
    on<ApiRequestEvent>(apiRequestEvent);
    on<SaveButtonPressedEvent>(saveNews);
    on<LoadSavedNewsEvent>(loadSavedNews);
    on<UnSaveNewsEvent>(unSaveNews);
  }

  FutureOr<void> apiRequestEvent(
      ApiRequestEvent event, Emitter<NewsState> emit) async {
    try {
      final response = await ApiMethods().getData() as Map<String, dynamic>;
      for (var x in response['articles']) {
        try {
          news.add(NewsModel.fromJson(x));
        } catch (e) {
        }
      }
      emit(NewsLoadedState(news: news));
    } catch (e) {
    }
  }

  FutureOr<void> saveNews(
      SaveButtonPressedEvent event, Emitter<NewsState> emit) {
    final variable = event.model.toJson();
    final encodedJson = jsonEncode(variable);
    DatabaseMethods().storeData(encodedJson, event.model.publishedAt);
    loadSavedNews(LoadSavedNewsEvent(), emit);
  }

  FutureOr<void> loadSavedNews(LoadSavedNewsEvent event, Emitter<NewsState> emit) {
    print('called');
    try{
      final listOfSavedStrings = DatabaseMethods().getStoredData();
      if (listOfSavedStrings.isNotEmpty){
        for (var x in listOfSavedStrings){
          final decodedJson = jsonDecode(x);
          NewsModel news = NewsModel.fromJson(decodedJson);
          hiveSavedNews.add(news);
        }
        print("loaded state emmited");
        emit(SavedNewsLoadedState(savedNews: hiveSavedNews));
      }
      else{
        print("no news emmited");
        emit(NONewsSavedState());
      }
    }catch(e){
      print('error is $e');
    }


  }

  FutureOr<void> unSaveNews(UnSaveNewsEvent event, Emitter<NewsState> emit) {
    DatabaseMethods().deleteData(event.key);
    hiveSavedNews.removeWhere((element)=> element.publishedAt== event.key);
    emit(NewsDeletedState(savedList: hiveSavedNews));

  }
}
