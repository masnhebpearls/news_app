import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/routes/routes.dart';
import 'package:news_app/features/screens/home_page/data/server_data/api_methods.dart';
import 'package:news_app/features/screens/home_page/presentation/bloc/news_bloc.dart';

@RoutePage()
class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsScaffold(
        routes: const [HomeAllNewsRoute(), LocalSavedNewsRoute()],
        bottomNavigationBuilder: (context, tabs) {
          return BottomNavigationBar(
            currentIndex: tabs.activeIndex,
            onTap: tabs.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.save_alt), label: "save")
            ],
          );
        },
      ),
    );
  }
}
