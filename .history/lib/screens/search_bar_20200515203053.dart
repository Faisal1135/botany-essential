import 'package:botany_essential/constant.dart';
import 'package:botany_essential/models/botmodel.dart';
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
    return Text("No result Found");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // implement buildSuggestions
    final searchlist = Hive.box<Botmodel>(kbotBox)
        .values
        .where((bot) => bot.term.contains(query))
        .toList();

    return ListView.builder(
      itemCount: searchlist.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {},
          leading: Icon(Icons.text_fields),
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
}
