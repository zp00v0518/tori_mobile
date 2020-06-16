import 'package:flutter/material.dart';
import '../../state/drawerData.dart';
import './Sidebar.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                  // backgroundImage: NetworkImage(userFoto),
                  ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          SideBar(),
        ],
      ),
    );
  }
}
