import 'dart:convert';

import 'package:botany_essential/screens/dictonary_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
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

    var _entries = Map<String, Botmodel>();
    _botDict.forEach((bot) {
      _entries[bot.term] = bot;
    });
    await Hive.box<Botmodel>(kbotBox).putAll(_entries);
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
                return SingleChildScrollView(
                  child: AlphabetListScrollView(
                    showPreview: true,
                    strList: allBotData.map((bot) => bot.term).toList(),
                    indexedHeight: (i) => 50,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, DictItemScreen.routeName,
                          arguments: allBotData[index]),
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        radius: 30,
                        child: Hero(
                          tag: "${allBotData[index].id}",
                          child: FaIcon(
                            FontAwesomeIcons.tree,
                            color: Colors.green,
                            size: 23,
                          ),
                        ),
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
                    ),
                  ),
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

// ListTile(
//                       onTap: () => Navigator.pushNamed(
//                           context, DictItemScreen.routeName,
//                           arguments: allBotData[index]),
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.lightGreen,
//                         radius: 30,
//                         child: Hero(
//                           tag: "${allBotData[index].id}",
//                           child: FaIcon(
//                             FontAwesomeIcons.tree,
//                             color: Colors.green,
//                             size: 23,
//                           ),
//                         ),
//                       ),
//                       title: Text(allBotData[index].term),
//                       subtitle: Text(
//                         allBotData[index].meaning,
//                         maxLines: 4,
//                       ),
//                       trailing: allBotData[index].isFavorite
//                           ? IconButton(
//                               icon: Icon(Icons.favorite),
//                               onPressed: () async =>
//                                   await togglefavorite(index))
//                           : IconButton(
//                               icon: Icon(Icons.favorite_border),
//                               onPressed: () async {
//                                 await togglefavorite(index);
//                               }),
//                     );
