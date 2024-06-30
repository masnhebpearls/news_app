import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import '../../models/news_model/news_model.dart';
import 'news_card.dart';

class ExtendedListViewBuilder extends StatefulWidget {
  const ExtendedListViewBuilder({
    super.key,
    required this.model,
    required this.isNewsView,
    required this.hasInternetConnection
  });

  final bool isNewsView;
  final bool hasInternetConnection;
  final List<NewsModel> model;

  @override
  ExtendedListViewBuilderState createState() => ExtendedListViewBuilderState();
}

// Make the state class public by removing the underscore
class ExtendedListViewBuilderState extends State<ExtendedListViewBuilder> {

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();


  @override
  Widget build(BuildContext context) {


    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return LiquidPullToRefresh(
          key: _refreshIndicatorKey,
          onRefresh: () async {
           context.read<NewsBloc>().add(CheckInternetConnection());
          },
          child: widget.model.isNotEmpty
              ? ListView.builder(
                  itemCount: widget.model.length,
                  itemBuilder: (context, index) {
                    final bool isSavedView = context
                        .read<NewsBloc>()
                        .hiveSavedNews
                        .contains(widget.model[index]);
                    return NewsCard(
                      hasInternetConnection: widget.hasInternetConnection,
                      isNewsView: widget.isNewsView,
                      model: widget.model[index],
                      isSavedView: isSavedView,
                      index: index,
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator()
                ),
        );
      },
    );
  }
}
