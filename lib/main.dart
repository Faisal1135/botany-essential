import 'package:botany_essential/screens/alpha_list.dart';
import 'package:botany_essential/screens/history_screen.dart';
import 'package:botany_essential/screens/main_home-page.dart';
import 'package:botany_essential/screens/main_screen.dart';
import 'package:botany_essential/screens/show_list_of_alpha.dart';
import './screens/favorite_page.dart';

import './constant.dart';
import './models/botmodel.dart';
import './screens/dictonary_details.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './screens/homepage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Botmodel>(BotmodelAdapter());
  await Hive.openBox<Botmodel>(kbotBox);
  await Hive.openBox(kHiveBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botany Essential',
      theme: ThemeData(
        canvasColor: Colors.lightGreen.shade100, //Colors.lightGreen.shade100,
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(bodyText2: TextStyle(fontFamily: "Alegreya")),
        primaryColor: Color(0xff028900), //Color(0xffd4344c), //,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: getMetaData() ? MainScreen() : MainHomePage(),
      routes: {
        Homepage.routeName: (context) => Homepage(),
        ALphaListScreen.routeName: (context) => ALphaListScreen(),
        FavoritePage.routeName: (context) => FavoritePage(),
        ListAccordingToaAlpha.routeName: (context) => ListAccordingToaAlpha(),
        MainScreen.routeName: (context) => MainScreen(),
        DictItemScreen.routeName: (context) => DictItemScreen(),
        HistoryPage.routeName: (context) => HistoryPage(),
        MainHomePage.routeName: (context) => MainHomePage(),
      },
    );
  }

  bool getMetaData() {
    return Hive.box(kHiveBox).get("isLoaded") == null;
  }
}
