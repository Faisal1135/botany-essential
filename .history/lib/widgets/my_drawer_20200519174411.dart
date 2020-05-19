import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home,
              text: "Homepage",
              onTap: () => Navigator.pushNamed(context, '/')),
        ],
      ),
    );
  }

  _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/images/plant2.jpg'))),
      child: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/plant.jpg')))),
          Positioned(
              top: 16.0,
              left: 16.0,
              child: Text("Botany \nEssential",
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
