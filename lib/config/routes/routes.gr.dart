// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsPage(
          model: args.model,
          isSavedView: args.isSavedView,
        ),
      );
    },
    HomeAllNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeAllNews(),
      );
    },
    LocalSavedNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocalSavedNews(),
      );
    },
    MainHomePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainHomePage(),
      );
    },
  };
}

/// generated route for
/// [DetailsPage]
class DetailsPageRoute extends PageRouteInfo<DetailsPageRouteArgs> {
  DetailsPageRoute({
    required NewsModel model,
    required bool isSavedView,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsPageRoute.name,
          args: DetailsPageRouteArgs(
            model: model,
            isSavedView: isSavedView,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsPageRoute';

  static const PageInfo<DetailsPageRouteArgs> page =
      PageInfo<DetailsPageRouteArgs>(name);
}

class DetailsPageRouteArgs {
  const DetailsPageRouteArgs({
    required this.model,
    required this.isSavedView,
  });

  final NewsModel model;

  final bool isSavedView;

  @override
  String toString() {
    return 'DetailsPageRouteArgs{model: $model, isSavedView: $isSavedView}';
  }
}

/// generated route for
/// [HomeAllNews]
class HomeAllNewsRoute extends PageRouteInfo<void> {
  const HomeAllNewsRoute({List<PageRouteInfo>? children})
      : super(
          HomeAllNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeAllNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocalSavedNews]
class LocalSavedNewsRoute extends PageRouteInfo<void> {
  const LocalSavedNewsRoute({List<PageRouteInfo>? children})
      : super(
          LocalSavedNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocalSavedNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainHomePage]
class MainHomePageRoute extends PageRouteInfo<void> {
  const MainHomePageRoute({List<PageRouteInfo>? children})
      : super(
          MainHomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainHomePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
