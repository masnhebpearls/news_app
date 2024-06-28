import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/snack_bar.dart';

import '../../../../../config/themes/styles.dart';
import '../bloc/news_bloc.dart';
import 'news_card.dart';

class DismissibleExtendedListview extends StatelessWidget {
  const DismissibleExtendedListview(
      {super.key, required this.model, required this.isNewsView});

  final List<NewsModel> model;
  final bool isNewsView;

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
                  return Dismissible(
                    key: ValueKey<int>(index),
                    onDismissed: (direction){
                      context.read<NewsBloc>().add(UnSaveNewsEvent(key: model[index].publishedAt));
                      showSnackBar("Removed from saved List", context);
                    },

                    child: NewsCard(
                      isNewsView: isNewsView,
                      model: model[index],
                      isSavedView: isSavedView,
                    ),
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
