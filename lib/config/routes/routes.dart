import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/screens/home_page/models/news_model/news_model.dart';
import '../../features/screens/home_page/presentation/UI/home_page/bottom_nav_pages/all_news.dart';
import '../../features/screens/home_page/presentation/UI/home_page/bottom_nav_pages/saved_news.dart';
import '../../features/screens/home_page/presentation/UI/home_page/home_page.dart';
import '../../features/screens/home_page/presentation/UI/view_news/view_news.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainHomePageRoute.page, initial: true, children: [
      AutoRoute(page: HomeAllNewsRoute.page),
      AutoRoute(page: LocalSavedNewsRoute.page)
    ]),
    AutoRoute(page: DetailsPageRoute.page)
    /// routes go here
  ];
}