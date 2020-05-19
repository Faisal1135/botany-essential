import 'dart:convert';
import 'dart:ui';

import 'package:botany_essential/models/botmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../constant.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "/Main-screen";

  Future<void> loadDictonaryFromJson() async {
    String path = "assets/json/final_dict.json";
    String content = await rootBundle.loadString(path);
    List jsonString = json.decode(content);
    List<Botmodel> _botDict =
        jsonString.map((item) => Botmodel.fromJson(item)).toList();

    var _entries = Map<String, Botmodel>();
    _botDict.forEach((bot) {
      _entries[bot.term] = bot;
    });
    await Hive.box<Botmodel>(kbotBox).putAll(_entries);
    await Hive.box(kHiveBox).put("isLoaded", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botany essential'),
      ),
      body: FutureBuilder(
        future: loadDictonaryFromJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
