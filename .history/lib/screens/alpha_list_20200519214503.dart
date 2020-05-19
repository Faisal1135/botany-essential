import '../widgets/alpha_grid.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class ALphaListScreen extends StatelessWidget {
  static const routeName = "/alpha-list-page";
  const ALphaListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.all(16),
        children: kalphaList
            .map(
              (alpha) => Griditem(
                title: alpha,
              ),
            )
            .toList(),
      ),
    );
  }
}
