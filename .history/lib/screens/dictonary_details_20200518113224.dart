import 'package:botany_essential/constant.dart';
import 'package:botany_essential/models/botmodel.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DictItemScreen extends StatelessWidget {
  static const routeName = "/dict-details-screen";

  Future<void> togglefavorite(Botmodel botin) async {
    final botbox = Hive.box<Botmodel>(kbotBox);

    final bot = botbox.get(botin.term);
    if (bot.isFavorite) {
      bot.isFavorite = false;
    } else {
      bot.isFavorite = true;
    }
    await botbox.put(bot.term, bot);
  }

  @override
  Widget build(BuildContext context) {
    final dict = ModalRoute.of(context).settings.arguments as Botmodel;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade400,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Botmodel>(kbotBox).listenable(),
        builder: (BuildContext context, Box<Botmodel> value, Widget child) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.2, vertical: size.height * 0.05),
                child: Column(
                  children: <Widget>[
                    FittedBox(
                      child: Text(
                        dict.term,
                        style: ktermTextStyle,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.black54,
                      child: IconButton(
                          icon: dict.isFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.amber,
                                  size: 30,
                                )
                              : Icon(Icons.favorite_border,
                                  color: Colors.amber, size: 30),
                          onPressed: () async {
                            final botobj = value.get(dict.term);
                            botobj.isFavorite = !botobj.isFavorite;
                            await value.put(botobj.term, botobj);
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.6,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    dict.innerLink == null
                        ? Container()
                        : Wrap(
                            children: dict.innerLink
                                .map(
                                  (link) => GFButton(
                                    shape: GFButtonShape.pills,
                                    color: Colors.amber,
                                    onPressed: () {
                                      final arg =
                                          Hive.box<Botmodel>(kbotBox).get(link);
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
              )
            ],
          );
        },
      ),
    );
  }
}

// Text(
//   dict.term,
//   textAlign: TextAlign.center,
// ),
// IconButton(
//     icon: dict.isFavorite
//         ? Icon(Icons.favorite)
//         : Icon(Icons.favorite_border),
//     onPressed: () async {
//       final botobj = value.get(dict.term);
//       botobj.isFavorite = !botobj.isFavorite;
//       await value.put(botobj.term, botobj);
//     }),
// SizedBox(height: 20),
// Container(
//   child: Text(dict.meaning),
//   padding: const EdgeInsets.all(16),
// ),
// dict.innerLink == null
//     ? Container()
//     : Column(
//         children: dict.innerLink
//             .map(
//               (link) => FlatButton(
//                 color: Colors.amber,
//                 onPressed: () {
//                   final arg =
//                       Hive.box<Botmodel>(kbotBox).get(link);
//                   Navigator.pushNamed(
//                       context, DictItemScreen.routeName,
//                       arguments: arg);
//                 },
//                 child: Text(link),
//               ),
//             )
//             .toList(),
//       ),