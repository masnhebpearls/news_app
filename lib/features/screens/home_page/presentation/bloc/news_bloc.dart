import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:news_app/features/screens/home_page/data/local_data/database_methods.dart';
import 'package:news_app/features/screens/home_page/data/server_data/api_methods.dart';
import '../../models/news_model/news_model.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';


part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<NewsModel> news = [];
  final List<NewsModel> hiveSavedNews = [];
  bool internetConnection = true;

  NewsBloc() : super(NewsInitial(hasInternetConnection: false)) {
    on<CheckInternetConnection>(checkInternetConnection);
    on<InitializeEvent>(initializeEvent);
    on<ApiRequestEvent>(apiRequestEvent);
    on<SaveButtonPressedEvent>(saveNews);
    on<LoadSavedNewsEvent>(loadSavedNews);
    on<UnSaveNewsEvent>(unSaveNews);
  }



  FutureOr<void> checkInternetConnection(CheckInternetConnection event, Emitter<NewsState> emit) async {
    bool result = await InternetConnection().hasInternetAccess;
    internetConnection = result;
    if (result){
      add(ApiRequestEvent());
    }
    else if (!result && (news.isEmpty)){
      emit(NewsLoadingErrorState(message: "No internet connection", hasInternetConnection: result));
    }
    else if (!result && (hiveSavedNews.isEmpty)){
      emit(SavedNewsErrorState(hasInternetConnection: result));
    }
  }
// Assuming that NewsModel, ApiMethods, and DatabaseMethods are defined elsewhere
  Future<void> initializeEvent(
      InitializeEvent event, Emitter<NewsState> emit) async {
    await loadSavedNews(LoadSavedNewsEvent(), emit);
    await apiRequestEvent(ApiRequestEvent(), emit);
  }



  Future<void> apiRequestEvent(
      ApiRequestEvent event, Emitter<NewsState> emit) async {
    bool result = await InternetConnection().hasInternetAccess;
    if (result){
      emit(NewsLoadingState(hasInternetConnection: result));
      try {
        final response = await ApiMethods().getData();
        news =[];
        for (var x in response['articles']) {
          try {
            news.add(NewsModel.fromJson(x));
          } catch (e) {
            // throw 'error';
          }
        }
        emit(NewsLoadedState(news: news, hasInternetConnection: result));
      } catch (e) {
        emit(NewsLoadingErrorState(message: e.toString(), hasInternetConnection: false));
        // throw 'error';
      }
    }
    else{
      emit(NewsLoadingErrorState(message: "No internet connection", hasInternetConnection: result));
    }

  }

  Future<void> saveNews(
      SaveButtonPressedEvent event, Emitter<NewsState> emit) async {
    bool result = await InternetConnection().hasInternetAccess;
    final variable = event.model.toJson();
    final encodedJson = jsonEncode(variable);
    DatabaseMethods().storeData(encodedJson, event.model.publishedAt);
    hiveSavedNews.insert(event.index, event.model);
    emit(NewsSaveState(savedList: hiveSavedNews, hasInternetConnection: result));
  }

  Future<void> loadSavedNews(
      LoadSavedNewsEvent event, Emitter<NewsState> emit) async {
    try {
      bool result = await InternetConnection().hasInternetAccess;
      final listOfSavedStrings = DatabaseMethods().getStoredData();
      if (listOfSavedStrings.isNotEmpty) {
        for (var x in listOfSavedStrings) {
          final decodedJson = jsonDecode(x);
          NewsModel news = NewsModel.fromJson(decodedJson);
          hiveSavedNews.add(news);
        }
        hiveSavedNews.sort((a, b) => a.publishedAt.compareTo(b.publishedAt));
        emit(SavedNewsLoadedState(savedNews: hiveSavedNews, hasInternetConnection: result));
      } else {
        emit(NoNewsSavedState(hasInternetConnection: result));
      }
    } catch (e) {
      emit(NoNewsSavedState(hasInternetConnection: false));
    }
  }

  FutureOr<void> unSaveNews(UnSaveNewsEvent event, Emitter<NewsState> emit) async {
    bool result = await InternetConnection().hasInternetAccess;
    DatabaseMethods().deleteData(event.key);
    hiveSavedNews.removeWhere((element) => element.publishedAt == event.key);
    emit(NewsDeletedState(savedList: hiveSavedNews, hasInternetConnection: result));
  }

}
