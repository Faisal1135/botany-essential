import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "/Main-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botany essential'),
      ),
      body: Container(child: Text('This is Botany essential')),
    );
  }
}
