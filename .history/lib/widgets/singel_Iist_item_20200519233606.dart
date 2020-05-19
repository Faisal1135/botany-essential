import '../helper/helper_function.dart';
import '../models/botmodel.dart';
import '../screens/dictonary_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingelListTile extends StatelessWidget {
  const SingelListTile({
    Key key,
    @required this.allBotData,
  }) : super(key: key);

  final List<Botmodel> allBotData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allBotData.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () => Navigator.pushNamed(context, DictItemScreen.routeName,
              arguments: allBotData[index]),
          leading: CircleAvatar(
            backgroundColor: Colors.lightGreen,
            radius: 30,
            child: Hero(
              tag: "${allBotData[index].id}",
              child: FaIcon(
                FontAwesomeIcons.tree,
                color: Colors.green,
                size: 23,
              ),
            ),
          ),
          title: Text(allBotData[index].term),
          subtitle: Text(
            allBotData[index].meaning,
            maxLines: 4,
          ),
          trailing: IconButton(
            icon: allBotData[index].isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () async {
              await HelperFunction.togglefavorite(allBotData[index].term);
            },
          ),
        );
      },
    );
  }
}
