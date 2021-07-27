import 'package:fello_project/screens/home_screen.dart';
import 'package:fello_project/screens/news_screen.dart';
import 'package:fello_project/utility/colors.dart';
import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;

  double get getHeight => MediaQuery.of(this).size.height;
}

PageRouteBuilder<dynamic> fadeScreenTransition(dynamic screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, anotherAnimation) {
      return screen;
    },
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

int navSelectedIndex = 0;

BottomNavigationBar getBottomNav(BuildContext context) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.article_rounded),
        label: 'News',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.sports_esports_rounded),
        label: 'Jumping Mario',
      ),
    ],
    currentIndex: navSelectedIndex,
    backgroundColor: Colors.white,
    selectedItemColor: colorAccent,
    unselectedItemColor: colorPrimary,
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      onBottomNavClicked(context, index);
    },
  );
}

onBottomNavClicked(BuildContext context, int index) {
  navSelectedIndex = index;
  switch (navSelectedIndex) {
    case 0:
      Navigator.of(context).push(fadeScreenTransition(const NewsScreen()));
      break;
    case 1:
      Navigator.of(context).push(fadeScreenTransition(const HomeScreen()));
      break;
  }
}
