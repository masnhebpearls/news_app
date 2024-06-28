import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/snack_bar.dart';
import '../../../../../config/themes/styles.dart';
import '../bloc/news_bloc.dart';
import 'news_card.dart';

///Returns a ListView.builder with dismissible as its child
class DismissibleExtendedListview extends StatefulWidget {
  const DismissibleExtendedListview({
    super.key,
    required this.model,
    required this.isNewsView,
  });

  final List<NewsModel> model;
  final bool isNewsView;

  @override
  DismissibleExtendedListviewState createState() =>
      DismissibleExtendedListviewState();
}

// Convert the private state class to a public one by removing the underscore
class DismissibleExtendedListviewState
    extends State<DismissibleExtendedListview> {
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
      print("internet connection status is $hasInternet");
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
            builder: (ctx, state) {
              return ListView.builder(
                itemCount: widget.model.length,
                itemBuilder: (context, index) {
                  final bool isSavedView = ctx
                      .read<NewsBloc>()
                      .hiveSavedNews
                      .contains(widget.model[index]);

                  return Dismissible(
                    key: ValueKey<int>(widget.model[index].hashCode),
                    onDismissed: (direction) {
                      ctx.read<NewsBloc>().add(UnSaveNewsEvent(
                          key: widget.model[index].publishedAt));
                      showSnackBar("Removed from saved List",
                          widget.model[index], ctx, true, index);
                    },
                    child: NewsCard(
                      hasInternetConnection: hasInternetConnection!,
                      index: index,
                      isNewsView: widget.isNewsView,
                      model: widget.model[index],
                      isSavedView: isSavedView,
                    ),
                  );
                },
              );
            },
          )
        : Center(
            child: Text(
              "No data",
              style: tittleTextInBlogCard,
            ),
          );
  }
}
