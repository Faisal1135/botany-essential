import 'package:flutter/material.dart';

class Griditem extends StatelessWidget {
  const Griditem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.amber,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            "title",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.amber.withOpacity(0.6), Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
