part of 'news_bloc.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<NewsModel> news;

  NewsLoadedState({required this.news});

}
