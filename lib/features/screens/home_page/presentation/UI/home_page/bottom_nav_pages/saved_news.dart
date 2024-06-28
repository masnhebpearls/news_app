import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/dismissible_extended_listview.dart';

import '../../../widgets/extendedListViewBuilder.dart';

@RoutePage()
class LocalSavedNews extends StatefulWidget {
  const LocalSavedNews({super.key});

  @override
  State<LocalSavedNews> createState() => _LocalSavedNewsState();
}

class _LocalSavedNewsState extends State<LocalSavedNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Saved News",
          style: tittleTextInBlogCard,
        )),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        switch (state) {
          case NewsSaveState(savedList: var savedList):
            return DismissibleExtendedListview(
              model: savedList,
              isNewsView: false,
            );

          case NewsDeletedState(savedList: var savedList):
            return DismissibleExtendedListview(
              model: savedList,
              isNewsView: false,
            );

          default:
            final List<NewsModel> savedList =
                context.read<NewsBloc>().hiveSavedNews;
            return DismissibleExtendedListview(
              model: savedList,
              isNewsView: false,
            );
        }
      }),
    );
  }
}
