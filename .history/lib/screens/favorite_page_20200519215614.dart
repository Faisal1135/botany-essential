import '../constant.dart';
import '../models/botmodel.dart';
import '../widgets/singel_Iist_item.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = "/favorite-page";
  const FavoritePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FovoriteList'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Botmodel>(kbotBox).listenable(),
        builder: (BuildContext context, Box<Botmodel> value, Widget child) {
          final allBotList =
              value.values.where((bot) => bot.isFavorite == true).toList();
          return Column(children: [
            Expanded(
                child: SingelListTile(
              allBotData: allBotList,
            ))
          ]);
        },
      ),
    );
  }
}
