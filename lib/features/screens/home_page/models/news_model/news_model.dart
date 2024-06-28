import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    required dynamic id,
    required String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
