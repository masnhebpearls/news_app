import 'package:auto_route/auto_route.dart';

import '../../features/screens/home_page/presentation/UI/bottom_nav_pages/all_news.dart';
import '../../features/screens/home_page/presentation/UI/bottom_nav_pages/saved_news.dart';
import '../../features/screens/home_page/presentation/UI/home_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainHomePageRoute.page, initial: true, children: [
      AutoRoute(page: HomeAllNewsRoute.page),
      AutoRoute(page: LocalSavedNewsRoute.page)
    ])
    /// routes go here
  ];
}