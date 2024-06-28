import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/routes/routes.dart';
import 'package:news_app/features/screens/home_page/models/news_model/news_model.dart';

import '../../../../../config/themes/styles.dart';

class NewsCard extends StatefulWidget {
  const NewsCard(
      {super.key,
      required this.model,
      required this.isSavedView,
      required this.isNewsView,
      required this.index});

  final NewsModel model;
  final bool isSavedView;
  final bool isNewsView;
  final int index;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  String getSmallerString() {
    if (widget.model.description.length > 50) {
      String newString = '${widget.model.description.substring(0, 50)}...';
      return newString;
    } else {
      String newString = widget.model.description;
      return newString;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        width * 0.05,
        0,
        width * 0.05,
        height * 0.0125,
      ),
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(DetailsPageRoute(
              model: widget.model,
              isSavedView: widget.isSavedView,
              isNewsView: widget.isNewsView,
              index: widget.index));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.075),
          ),
          elevation: 10,
          child: Container(
            color: backgroundColor,
            width: width * 0.9,
            height: height * 0.2,
            child: Row(
              children: [
                SizedBox(
                  height: height * 0.0125,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.0075,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.025, height * 0.0075, 0, 0),
                      child: SizedBox(
                        width: width * 0.45,
                        child: AutoSizeText(
                          widget.model.title,
                          style: tittleTextInBlogCard,
                          maxFontSize: 20,
                          maxLines: 4,
                          minFontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.025),
                      child: SizedBox(
                        width: width * 0.45,
                        height: height * 0.065,
                        child: AutoSizeText(
                          widget.model.description,
                          style: textInBlogCard,
                          maxLines: 4,
                          minFontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.025, height * 0.00075, width * 0, 0),
                  child: Hero(
                    tag: widget.isNewsView
                        ? !widget.isSavedView
                            ? '${widget.model.url} news'
                            : "news saved ${widget.model.url}"
                        : !widget.isSavedView
                            ? '${widget.model.url} saved'
                            : "saved saved ${widget.model.url}",
                    child: SizedBox(
                      width: width * 0.35,
                      height: height * 0.25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(width * 0.05),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(widget.model.urlToImage)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
