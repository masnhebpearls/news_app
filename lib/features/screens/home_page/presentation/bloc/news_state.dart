part of 'news_bloc.dart';

sealed class NewsState {
  final bool hasInternetConnection;

  NewsState({required this.hasInternetConnection});
}

final class NewsInitial extends NewsState {
  NewsInitial({required super.hasInternetConnection});
}

class NewsLoadingState extends NewsState {
  NewsLoadingState({required super.hasInternetConnection});
}

class NewsLoadedState extends NewsState {
  final List<NewsModel> news;


  NewsLoadedState({required this.news, required super.hasInternetConnection});
}

class NewsLoadingErrorState extends NewsState {
  final String message;

  NewsLoadingErrorState({required this.message, required super.hasInternetConnection});

}

class SavedNewsErrorState extends NewsState {
  SavedNewsErrorState({required super.hasInternetConnection});
}

class SavedNewsLoadedState extends NewsState {
  final List<NewsModel> savedNews;

  SavedNewsLoadedState({required this.savedNews, required super.hasInternetConnection});
}

class NewsDeletedState extends NewsState {
  final List<NewsModel> savedList;

  NewsDeletedState({required this.savedList, required super.hasInternetConnection});
}

class NoNewsSavedState extends NewsState {
  NoNewsSavedState({required super.hasInternetConnection});
}

class NewsSaveState extends NewsState {
  final List<NewsModel> savedList;

  NewsSaveState({required this.savedList, required super.hasInternetConnection});
}
