import 'package:botany_essential/constant.dart';
import 'package:botany_essential/models/botmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../helper/helper_function.dart';

class DictItemScreen extends StatelessWidget {
  static const routeName = "/dict-details-screen";
  @override
  Widget build(BuildContext context) {
    final dict = ModalRoute.of(context).settings.arguments as Botmodel;

    return Scaffold(
      appBar: AppBar(
        title: Text(dict.term),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            dict.term,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Container(
            child: Text(dict.meaning),
            padding: const EdgeInsets.all(16),
          ),
          dict.innerLink == null
              ? Container()
              : Column(
                  children: dict.innerLink
                      .map(
                        (link) => FlatButton(
                          color: Colors.amber,
                          onPressed: () {
                            final arg = Hive.box<Botmodel>(kbotBox).get(link);
                            Navigator.pushNamed(
                                context, DictItemScreen.routeName,
                                arguments: arg);
                          },
                          child: Text(link),
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}
