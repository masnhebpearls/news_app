import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/config/routes/routes.dart';
import '../../../../../config/themes/styles.dart';

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
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 32,
            elevation: 10,
            selectedFontSize: 24,
            unselectedFontSize: 18,
            selectedItemColor: selectedNavBarColor,
            unselectedItemColor: unSelectedNavBarColor,
            currentIndex: tabs.activeIndex,
            onTap: tabs.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidHeart), label: "")
            ],
          );
        },
      ),
    );
  }
}
