import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/dismissible_extended_listview.dart';

import '../../../widgets/extended_list_view_builder.dart';

@RoutePage()
class LocalSavedNews extends StatefulWidget {
  const LocalSavedNews({super.key});

  @override
  State<LocalSavedNews> createState() => _LocalSavedNewsState();
}

class _LocalSavedNewsState extends State<LocalSavedNews> {

  Future<bool> geInternetConnection() async {
    return await InternetConnection().hasInternetAccess;
  }
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
        print("saved state is $state");
        switch (state) {
          case NewsSaveState(savedList: var savedList, hasInternetConnection: bool hasInternetConnection):
            return DismissibleExtendedListview(
              hasInternetConnection: hasInternetConnection,
              model: savedList,
              isNewsView: false,
            );

          case NewsDeletedState(savedList: var savedList, hasInternetConnection: bool hasInternetConnection):
            return DismissibleExtendedListview(
              hasInternetConnection: hasInternetConnection,
              model: savedList,
              isNewsView: false,
            );

          default:
            final List<NewsModel> savedList =
                context.read<NewsBloc>().hiveSavedNews;
            return DismissibleExtendedListview(
              hasInternetConnection: state.hasInternetConnection,
              model: savedList,
              isNewsView: false,
            );
        }
      }),
    );
  }
}
