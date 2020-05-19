import 'package:botany_essential/constant.dart';
import 'package:flutter/material.dart';

class Griditem extends StatelessWidget {
  final String title;
  const Griditem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.amber,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: ktermTextStyle,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green.withOpacity(0.6), Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
