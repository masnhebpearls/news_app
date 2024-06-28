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
    on<InitializeEvent>(initializeEvent);
    on<ApiRequestEvent>(apiRequestEvent);
    on<SaveButtonPressedEvent>(saveNews);
    on<LoadSavedNewsEvent>(loadSavedNews);
    on<UnSaveNewsEvent>(unSaveNews);
  }

// Assuming that NewsModel, ApiMethods, and DatabaseMethods are defined elsewhere
  Future<void> initializeEvent(InitializeEvent event, Emitter<NewsState> emit) async {
    await loadSavedNews(LoadSavedNewsEvent(), emit);
    await apiRequestEvent(ApiRequestEvent(), emit);
  }

  Future<void> apiRequestEvent(ApiRequestEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());
    try {
      final response = await ApiMethods().getData();
      for (var x in response['articles']) {
        try {
          news.add(NewsModel.fromJson(x));
        } catch (e) {
          // throw 'error';
        }
      }
      emit(NewsLoadedState(news: news));
    } catch (e) {
      emit(NewsLoadingErrorState());
      // throw 'error';
    }
  }

  Future<void> saveNews(SaveButtonPressedEvent event, Emitter<NewsState> emit) async {
    final variable = event.model.toJson();
    final encodedJson = jsonEncode(variable);
    DatabaseMethods().storeData(encodedJson, event.model.publishedAt);
    hiveSavedNews.add(event.model);
    emit(NewsSaveState(savedList: hiveSavedNews));
  }

  Future<void> loadSavedNews(LoadSavedNewsEvent event, Emitter<NewsState> emit) async {
    try {
      final listOfSavedStrings = DatabaseMethods().getStoredData();
      if (listOfSavedStrings.isNotEmpty) {
        for (var x in listOfSavedStrings) {
          final decodedJson = jsonDecode(x);
          NewsModel news = NewsModel.fromJson(decodedJson);
          hiveSavedNews.add(news);
        }
        emit(SavedNewsLoadedState(savedNews: hiveSavedNews));
      } else {
        emit(NoNewsSavedState());
      }
    } catch (e) {
      emit(NoNewsSavedState());
    }
  }

  FutureOr<void> unSaveNews(UnSaveNewsEvent event, Emitter<NewsState> emit) {
    DatabaseMethods().deleteData(event.key);
    hiveSavedNews.removeWhere((element) => element.publishedAt == event.key);
    emit(NewsDeletedState(savedList: hiveSavedNews));
  }


}
