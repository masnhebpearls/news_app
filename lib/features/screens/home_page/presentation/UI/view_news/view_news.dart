import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/config/themes/styles.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/screens/home_page/presentation/widgets/snack_bar.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {super.key,
      required this.model,
      required this.isSavedView,
      required this.isNewsView,
      required this.index,
      required this.hasInternetConnection
      });

  final bool isSavedView;
  final bool isNewsView;
  final NewsModel model;
  final int index;
  final bool hasInternetConnection;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<NewsBloc, NewsState>(
            listener: (c, state) {
              if (state.runtimeType == NewsSaveState) {
                showSnackBar("Saved Successfully", widget.model, c, false, 0);
              }
              if (state.runtimeType == NewsDeletedState) {
                showSnackBar("Removed from saved", widget.model, c, true, widget.index);
              }
              // TODO: implement listener
            },
            builder: (ctx, state) {
              return IconButton(
                  onPressed: !ctx.read<NewsBloc>().hiveSavedNews.contains(widget.model)
                      ? () => ctx
                          .read<NewsBloc>()
                          .add(SaveButtonPressedEvent(model: widget.model, index: 0))
                      : () => ctx
                          .read<NewsBloc>()
                          .add(UnSaveNewsEvent(key: widget.model.publishedAt)),
                  icon: ctx.read<NewsBloc>().hiveSavedNews.contains(widget.model)
                      ? const Icon(FontAwesomeIcons.solidHeart)
                      : const Icon(FontAwesomeIcons.heart));
            },
          )
        ],
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.0125, width * 0.05, 0),
              child: AutoSizeText(
                widget.model.title,
                style: tittleTextInBlogCard,
                maxLines: 7,
                minFontSize: 16,
                maxFontSize: 26,
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Hero(
                tag: widget.isNewsView
                    ? !widget.isSavedView
                        ? '${widget.model.url} news'
                        : "news saved ${widget.model.url}"
                    : !widget.isSavedView
                        ? '${widget.model.url} saved'
                        : "saved saved ${widget.model.url}",
                child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.075),
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: widget.hasInternetConnection ? Image.network(widget.model.urlToImage): Image.asset('images/error.gif')
                    ),
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
                height: height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Scrollbar(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      child: Text(widget.model.content),
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
    );
  }
}
