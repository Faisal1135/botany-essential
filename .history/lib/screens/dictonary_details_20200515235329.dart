import 'package:botany_essential/models/botmodel.dart';
import 'package:flutter/material.dart';

class DictItemScreen extends StatelessWidget {
  static const routeName = "/dict-details-screen";
  @override
  Widget build(BuildContext context) {
    final routeParm =
        ModalRoute.of(context).settings.arguments as Map<dynamic, Botmodel>;
    print(routeParm);
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Container(),
    );
  }
}
