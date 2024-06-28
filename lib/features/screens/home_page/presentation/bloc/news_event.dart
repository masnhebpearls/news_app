part of 'news_bloc.dart';

sealed class NewsEvent {}


class ApiRequestEvent extends NewsEvent {}


class SaveButtonPressedEvent extends NewsEvent {
  final NewsModel model;

  SaveButtonPressedEvent({required this.model});

}

class LoadSavedNewsEvent extends NewsEvent {}

class UnSaveNewsEvent extends NewsEvent {
  final String key;

  UnSaveNewsEvent({required this.key});

}
