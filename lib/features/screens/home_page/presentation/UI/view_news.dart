import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  DetailsPage(
      {super.key,
        required this.model,
      required this.isSavedView,
      required this.isNewsView});

  final bool isSavedView;
  final bool isNewsView;
  final NewsModel model;

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state.runtimeType == NewsSaveState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Saved successfully",
                  style: textInSnackBar,
                ),
                backgroundColor: Colors.white,
              ),
            );
          }
          if (state.runtimeType == NewsDeletedState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Removed from saved news",
                  style: textInSnackBar,
                ),
                backgroundColor: Colors.white,
              ),
            );
          }
          // TODO: implement listener
        },
        builder: (ctx, state) {
          return FloatingActionButton(
            onPressed: ! ctx.read<NewsBloc>().hiveSavedNews.contains(model)
                ? () => ctx
                    .read<NewsBloc>()
                    .add(SaveButtonPressedEvent(model: model))
                : () => ctx
                    .read<NewsBloc>()
                    .add(UnSaveNewsEvent(key: model.publishedAt)),
            child: ctx.read<NewsBloc>().hiveSavedNews.contains(model) ? const Icon(FontAwesomeIcons.solidHeart) : const Icon(FontAwesomeIcons.heart)
          );
        },
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.fromLTRB(width * 0.025, height * 0.045, 0, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.maybePop();
                      },
                      icon: const Icon(FontAwesomeIcons.arrowLeft),
                    ),
                    SizedBox(
                      width: width * 0.8,
                      height: height * 0.1,
                      child: AutoSizeText(
                        model.title,
                        style: tittleTextInBlogCard,
                        maxLines: 5,
                        minFontSize: 16,
                        maxFontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Hero(
                  tag: isNewsView
                      ? !isSavedView
                          ? '${model.url} news'
                          : "news saved ${model.url}"
                      : !isSavedView
                          ? '${model.url} saved'
                          : "saved saved ${model.url}",
                  child: SizedBox(
                    width: width * 0.9,
                    height: height * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(width * 0.075),
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(model.urlToImage)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Scrollbar(
                      controller: _scrollController,
                      child: SingleChildScrollView(
                        child: Text(model.content ??
                            model.description ??
                            model.url ??
                            ''),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.0125,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
