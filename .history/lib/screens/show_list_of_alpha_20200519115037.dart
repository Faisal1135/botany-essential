import 'package:flutter/material.dart';

class ListAccordingToaAlpha extends StatelessWidget {
  static const routeName = "list-according-to-alpha";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: SafeArea(
        child: Text("Its Working"),
      ),
    );
  }
}
