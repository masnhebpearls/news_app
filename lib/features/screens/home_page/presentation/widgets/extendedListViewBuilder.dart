import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import '../../models/news_model/news_model.dart';
import 'news_card.dart';

class ExtendedListViewBuilder extends StatefulWidget {
  const ExtendedListViewBuilder({
    super.key,
    required this.model,
    required this.isNewsView,
  });

  final bool isNewsView;
  final List<NewsModel> model;

  @override
  ExtendedListViewBuilderState createState() => ExtendedListViewBuilderState();
}

// Make the state class public by removing the underscore
class ExtendedListViewBuilderState extends State<ExtendedListViewBuilder> {
  bool? hasInternetConnection;

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    final hasInternet = await InternetConnection().hasInternetAccess;
    setState(() {
      print("connection in root is $hasInternetConnection");
      hasInternetConnection = hasInternet;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (hasInternetConnection == null) {
      // Show a loading indicator while checking for internet connectivity
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return LiquidPullToRefresh(
          key: _refreshIndicatorKey,
          onRefresh: () async {
            await _checkInternetConnection();
            if (hasInternetConnection!) {
              context.read<NewsBloc>().add(ApiRequestEvent());
            }
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
                      hasInternetConnection: hasInternetConnection!,
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
