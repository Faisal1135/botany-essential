import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static const routeName = "/homepage";
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Botany essential'),
        ),
        body: Container(
          child: Text('We are working'),
        ),
      ),
    );
  }
}
