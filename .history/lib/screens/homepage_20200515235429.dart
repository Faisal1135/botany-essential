import 'dart:convert';

import 'package:botany_essential/screens/dictonary_details.dart';

import '../constant.dart';
import '../models/botmodel.dart';
import '../screens/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homepage extends StatefulWidget {
  static const routeName = "/homepage";
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Botmodel> botDict;

  Future<List<Botmodel>> loadDictonaryFromJson() async {
    String path = "assets/json/final_dict.json";
    String content = await rootBundle.loadString(path);
    List jsonString = json.decode(content);
    List<Botmodel> _botDict =
        jsonString.map((item) => Botmodel.fromJson(item)).toList();
    await Hive.box<Botmodel>(kbotBox).addAll(_botDict);
    return _botDict;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Botany essential'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: Searchbar(),
                );
              },
            ),
          ],
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
            return ValueListenableBuilder(
              valueListenable: Hive.box<Botmodel>(kbotBox).listenable(),
              builder:
                  (BuildContext context, Box<Botmodel> value, Widget child) {
                List<Botmodel> allBotData = value.values.toList();
                return ListView.builder(
                  itemCount: allBotData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final _key = Hive.box<Botmodel>(kbotBox).keyAt(index);
                    return ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, DictItemScreen.routeName,
                          arguments: {_key: allBotData[index]}),
                      leading: CircleAvatar(
                        radius: 20,
                        child: Text(index.toString()),
                      ),
                      title: Text(allBotData[index].term),
                      subtitle: Text(
                        allBotData[index].meaning,
                        maxLines: 4,
                      ),
                      trailing: allBotData[index].isFavorite
                          ? IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () async =>
                                  await togglefavorite(index))
                          : IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () async {
                                await togglefavorite(index);
                              }),
                    );
                  },
                );
              },
            );
            // return Text(snapshot.data.first.toMap().toString());
          },
        ),
      ),
    );
  }

  Future<void> togglefavorite(int index) async {
    final botbox = Hive.box<Botmodel>(kbotBox);
    final key = botbox.keyAt(index);
    final bot = botbox.get(key);
    if (bot.isFavorite) {
      bot.isFavorite = false;
    } else {
      bot.isFavorite = true;
    }
    await botbox.put(key, bot);
  }
}
