import 'package:botany_essential/constant.dart';
import 'package:botany_essential/helper/helper_function.dart';
import 'package:botany_essential/screens/show_list_of_alpha.dart';
import 'package:flutter/material.dart';

class Griditem extends StatelessWidget {
  final String title;
  const Griditem({Key key, this.title}) : super(key: key);

  showAlphaListPage(String alpha, BuildContext context) async {
    final arglist = HelperFunction.findWithAlpha(alpha);
    await Navigator.pushNamed(context, ListAccordingToaAlpha.routeName,
        arguments: arglist);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showAlphaListPage(title, context),
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
