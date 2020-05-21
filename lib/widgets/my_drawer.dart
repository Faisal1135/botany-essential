import 'package:flutter/material.dart';
import '../screens/alpha_list.dart';
import '../screens/history_screen.dart';
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
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          _createDrawerItem(
            icon: Icons.text_format,
            text: "Alphabetic order",
            onTap: () => Navigator.pushReplacementNamed(
                context, ALphaListScreen.routeName),
          ),
          _createDrawerItem(
            icon: Icons.favorite,
            text: "Favorite",
            onTap: () =>
                Navigator.pushReplacementNamed(context, FavoritePage.routeName),
          ),
          _createDrawerItem(
            icon: Icons.history,
            text: "History",
            onTap: () =>
                Navigator.pushReplacementNamed(context, HistoryPage.routeName),
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
              child: Text("Botany \nEssential",
                  style: TextStyle(
                      color: Colors.green.shade700,
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
          Icon(
            icon,
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: "ZillaSlab",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
