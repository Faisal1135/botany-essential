import 'package:flutter/material.dart';
import '../screens/favorite_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home,
            text: "Full Dicotary",
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          _createDrawerItem(
            icon: Icons.text_format,
            text: "Alphabetic order",
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          _createDrawerItem(
            icon: Icons.favorite,
            text: "Favorite",
            onTap: () => Navigator.pushNamed(context, FavoritePage.routeName),
          ),
        ],
      ),
    );
  }

  _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/images/plant2.jpg'))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 10.0,
              right: 16.0,
              child: Text("Botany Essential",
                  style: TextStyle(
                      color: Colors.green.shade900,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700))),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
