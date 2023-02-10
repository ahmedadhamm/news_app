import 'package:apinew_app/core/style/mytheme.dart';
import 'package:apinew_app/setting/setteing_tab.dart';
import 'package:apinew_app/view/home/home_view.dart';
import 'package:apinew_app/view/news/news_details_screen.dart';
import 'package:apinew_app/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:apinew_app/search/search_news.dart';

void main() {
  runApp(MyApplaiction());
}

class MyApplaiction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dome',
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeView.routName: (context) => HomeView(),
        NewsDetailsScreen.routName: (context) => NewsDetailsScreen(),
        SearchNews.routName: (context) => SearchNews(),
        SettingTab.routName: (context) => SettingTab(),
      },
    );
  }
}
