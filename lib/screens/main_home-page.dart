import '../constant.dart';
import '../models/botmodel.dart';
import '../screens/dictonary_details.dart';
import '../screens/history_screen.dart';
import '../screens/search_bar.dart';
import 'package:getflutter/getflutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  static const routeName = "/Main-Home-Page";
  const MainHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 1,
        title: Center(
            child: Text(
          "Botany Essential",
          style: ktermTextStyle,
        )),
      ),
      drawer: AppDrawer(),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Botmodel>(kbotBox).listenable(),
        builder: (BuildContext context, Box<Botmodel> value, Widget child) {
          return ListView(
            children: <Widget>[
              InkWell(
                onTap: () =>
                    showSearch(context: context, delegate: Searchbar()),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      )),
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Search for a Word',
                            style: const TextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, HistoryPage.routeName),
                child: Container(
                  // color: Colors.lightGreen.shade400,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        color: Colors.lime.shade900,
                      ),
                      SizedBox(width: 10),
                      Hero(
                        tag: "history",
                        child: Text(
                          'History',
                          style: const TextStyle(
                            fontFamily: "ZillaSlab",
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffE8EBF1)),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: value.values
                      .where((bot) => bot.isHistory == true)
                      .toList()
                      .getRange(0, 5)
                      .map(
                        (val) => InkWell(
                          onTap: () async => await Navigator.pushNamed(
                              context, DictItemScreen.routeName,
                              arguments: value.get(val.term)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(val.term),
                                    Spacer(),
                                    Icon(Icons.star_border)
                                  ],
                                ),
                                Divider()
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              GFCard(
                boxFit: BoxFit.cover,
                image: Image.asset('assets/images/plant2.jpg'),
                title: GFListTile(
                    title: Text('Card Title'),
                    icon: GFIconButton(
                      onPressed: null,
                      icon: Icon(Icons.star_border),
                      type: GFButtonType.transparent,
                    )),
                content: Text("Some quick example text to build on the card"),
              ),
            ],
          );
        },
      ),
    );
  }
}
