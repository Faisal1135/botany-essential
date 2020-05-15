import 'package:botany_essential/constant.dart';
import 'package:botany_essential/models/botmodel.dart';
import 'package:botany_essential/screens/dictonary_details.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Searchbar extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchlist = Hive.box<Botmodel>(kbotBox)
        .values
        .where((bot) => bot.term.startsWith(query))
        .toList();
    return ListView.builder(
      itemCount: searchlist.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () => Navigator.pushNamed(context, DictItemScreen.routeName,
              arguments: searchlist[index]),
          leading: Icon(Icons.spa),
          title: RichText(
            text: TextSpan(
              text: searchlist[index].term.substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: searchlist[index].term.substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // implement buildSuggestions
    final searchlist = Hive.box<Botmodel>(kbotBox)
        .values
        .where((bot) => bot.term.startsWith(query))
        .toList();

    return query.isEmpty
        ? Container()
        : ListView.builder(
            itemCount: searchlist.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => Navigator.pushNamed(
                    context, DictItemScreen.routeName,
                    arguments: searchlist[index]),
                leading: Icon(Icons.spa),
                title: RichText(
                  text: TextSpan(
                    text: searchlist[index].term.substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: searchlist[index].term.substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
              );
            },
          );
  }
}
