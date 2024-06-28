part of 'news_bloc.dart';

sealed class NewsEvent {}

class InitializeEvent extends NewsEvent {}

class ApiRequestEvent extends NewsEvent {}

class SaveButtonPressedEvent extends NewsEvent {
  final NewsModel model;
  final int index;

  SaveButtonPressedEvent({required this.model, required this.index});
}

class LoadSavedNewsEvent extends NewsEvent {}

class UnSaveNewsEvent extends NewsEvent {
  final String key;

  UnSaveNewsEvent({required this.key});
}
