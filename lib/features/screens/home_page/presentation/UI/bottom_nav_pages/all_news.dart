import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/UI/bottom_nav_pages/saved_news.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/news_card.dart';

import '../../widgets/extendedListViewBuilder.dart';

@RoutePage()
class HomeAllNews extends StatefulWidget {
  const HomeAllNews({super.key});

  @override
  State<HomeAllNews> createState() => _HomeAllNewsState();
}

class _HomeAllNewsState extends State<HomeAllNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Top headlines", style: tittleTextInBlogCard,)),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (ctx, state) {
          switch (state.runtimeType) {
            case (const (NewsInitial)):
              return const Center(
                child: CircularProgressIndicator(),
              );
            case (const (NewsLoadedState)):
              return ExtendedListViewBuilder(model: (state as NewsLoadedState).news, isNewsView: true,);

            default:
              return ExtendedListViewBuilder(model: (ctx.read<NewsBloc>().news), isNewsView: true,);
          }
        },
      ),
    );
  }
}
