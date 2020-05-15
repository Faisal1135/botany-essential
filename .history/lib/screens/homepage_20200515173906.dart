import 'dart:convert';

import 'package:botany_essential/models/botmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  static const routeName = "/homepage";
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Botmodel> botDict;

  Future<List<Botmodel>> loadDictonaryFromJson() async {
    String path = "assets/json/dictonary_botany.json";
    String content = await rootBundle.loadString(path);
    List jsonString = json.decode(content);
    List<Botmodel> _botDict =
        jsonString.map((item) => Botmodel.fromJson(item)).toList();
    return _botDict;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Botany essential'),
        ),
        body: FutureBuilder(
          future: loadDictonaryFromJson(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Botmodel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Text("Something went wrong bro");
            }
            return Text(snapshot.data.first.toMap().toString());
          },
        ),
      ),
    );
  }
}
