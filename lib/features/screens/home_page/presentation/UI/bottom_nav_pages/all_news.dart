import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/news_card.dart';

@RoutePage()
class HomeAllNews extends StatefulWidget {
  const HomeAllNews({super.key});

  @override
  State<HomeAllNews> createState() => _HomeAllNewsState();
}

class _HomeAllNewsState extends State<HomeAllNews> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()..add(ApiRequestEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Top headlines", style: tittleTextInBlogCard,)),
        ),
        body: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case (const (NewsLoadedState)):
                return ListView.builder(
                  itemCount: (state as NewsLoadedState).news.length,
                  itemBuilder: (context, index) {
                    return NewsCard(model: state.news[index], isSavedView: false,);
                  },
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}
