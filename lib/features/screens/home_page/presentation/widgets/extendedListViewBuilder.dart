import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
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

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    // Perform the internet connectivity check and update state
    final hasInternet = await InternetConnection().hasInternetAccess;
    setState(() {
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

    return widget.model.isNotEmpty
        ? BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              return ListView.builder(
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
              );
            },
          )
        : Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/no_data.gif'),
              ),
            ),
          );
  }
}
