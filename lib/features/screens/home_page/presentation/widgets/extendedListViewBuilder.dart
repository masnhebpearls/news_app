import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';

import '../../../../../config/themes/styles.dart';
import '../../models/news_model/news_model.dart';
import 'news_card.dart';

class ExtendedListViewBuilder extends StatelessWidget {
  const ExtendedListViewBuilder(
      {super.key, required this.model, required this.isNewsView});

  final bool isNewsView;

  final List<NewsModel> model;

  @override
  Widget build(BuildContext context) {
    return model.isNotEmpty
        ? BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: model.length,
                itemBuilder: (context, index) {
                  final bool isSavedView = context
                      .read<NewsBloc>()
                      .hiveSavedNews
                      .contains(model[index]);
                  return NewsCard(
                    isNewsView: isNewsView,
                    model: model[index],
                    isSavedView: isSavedView,
                  );
                },
              );
            },
          )
        : Center(
            child: Text(
              "No data ",
              style: tittleTextInBlogCard,
            ),
          );
  }
}
