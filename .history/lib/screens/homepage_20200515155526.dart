import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

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
