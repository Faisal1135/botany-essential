import 'package:flutter/material.dart';

class ALphaListScreen extends StatelessWidget {
  const ALphaListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(16),
      children: ,
      );
  }
}