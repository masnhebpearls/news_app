part of 'news_bloc.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState{}

class NewsLoadedState extends NewsState {
  final List<NewsModel> news;

  NewsLoadedState({required this.news});

}

class NewsLoadingErrorState extends NewsState{}

class SavedNewsErrorState extends NewsState{}


class SavedNewsLoadedState extends NewsState {
  final List<NewsModel> savedNews;

  SavedNewsLoadedState({required this.savedNews});
}


class NewsDeletedState extends NewsState{
  final List<NewsModel> savedList;

  NewsDeletedState({required this.savedList});
}

class NoNewsSavedState extends NewsState {}

class NewsSaveState extends NewsState {
  final List<NewsModel> savedList;

  NewsSaveState({required this.savedList});


}