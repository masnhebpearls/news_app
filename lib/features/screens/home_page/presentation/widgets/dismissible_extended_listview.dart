import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/snack_bar.dart';
import '../bloc/news_bloc.dart';
import 'news_card.dart';

///Returns a ListView.builder with dismissible as its child
class DismissibleExtendedListview extends StatefulWidget {
  const DismissibleExtendedListview({
    super.key,
    required this.model,
    required this.isNewsView,
    required this.hasInternetConnection
  });

  final List<NewsModel> model;
  final bool isNewsView;
  final bool hasInternetConnection;

  @override
  DismissibleExtendedListviewState createState() =>
      DismissibleExtendedListviewState();
}

// Convert the private state class to a public one by removing the underscore
class DismissibleExtendedListviewState
    extends State<DismissibleExtendedListview> {

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();


  @override
  Widget build(BuildContext context) {

    return widget.model.isNotEmpty
        ? BlocBuilder<NewsBloc, NewsState>(
            builder: (ctx, state) {
              return LiquidPullToRefresh(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  context.read<NewsBloc>().add(CheckInternetConnection());
                },
                child: ListView.builder(
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
                        hasInternetConnection: widget.hasInternetConnection,
                        index: index,
                        isNewsView: widget.isNewsView,
                        model: widget.model[index],
                        isSavedView: isSavedView,
                      ),
                    );
                  },
                ),
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
