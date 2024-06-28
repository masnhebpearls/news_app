import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import '../../../widgets/extendedListViewBuilder.dart';

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
            child: Text(
          "Top headlines",
          style: tittleTextInBlogCard,
        )),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (ctx, state) {
          switch (state) {
            case NewsLoadingErrorState():
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height*0.5,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('images/no_data.gif'),
                  ),
                ),
              );

            case NewsLoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case NewsLoadedState(news: var news):
              return ExtendedListViewBuilder(
                model: news,
                isNewsView: true,
              );

            default:
              return ExtendedListViewBuilder(
                model: ctx.read<NewsBloc>().news,
                isNewsView: true,
              );
          }
        },
      ),
    );
  }
}
