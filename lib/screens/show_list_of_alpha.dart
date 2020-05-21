import '../models/botmodel.dart';
import '../widgets/singel_Iist_item.dart';
import 'package:flutter/material.dart';

class ListAccordingToaAlpha extends StatelessWidget {
  static const routeName = "list-according-to-alpha";

  @override
  Widget build(BuildContext context) {
    final allbotList =
        ModalRoute.of(context).settings.arguments as List<Botmodel>;

    return Scaffold(
      appBar: AppBar(
        title: Text("${allbotList.first.term[0]} -List"),
      ),
      body: SafeArea(
        child: SingelListTile(allBotData: allbotList),
      ),
    );
  }
}
