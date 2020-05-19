import 'package:botany_essential/screens/alpha_list.dart';
import 'package:botany_essential/screens/main_screen.dart';
import 'package:botany_essential/screens/show_list_of_alpha.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ALphaListScreen(),
        ListAccordingToaAlpha.routeName: (context) => ListAccordingToaAlpha(),
        Homepage.routeName: (context) => Homepage(),
        DictItemScreen.routeName: (context) => DictItemScreen(),
      },
    );
  }
}
