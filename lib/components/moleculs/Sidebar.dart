import 'package:flutter/material.dart';
import '../../state/drawerData.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<Widget> items = [];
  createItems() {
    for (var i = 0; i < menuData.length; i++) {
      final item = menuData[i];
      items.add(NavItem(tab: item));
    }
  }

  @override
  void initState() {
    super.initState();
    createItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items,
    );
  }
}

class NavItem extends StatefulWidget {
  final tab;
  NavItem({@required this.tab});

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isVisible = false;
  final List<Widget> subItems = [];

  createItems() {
    for (var i = 0; i < widget.tab['child'].length; i++) {
      final item = widget.tab['child'][i];
      subItems.add(SubNavItem(subTab: item));
    }
  }

  @override
  void initState() {
    super.initState();
    createItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add_circle),
                  SizedBox(width: 16.0,),
                  Text(widget.tab['title']),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Visibility(
                visible: isVisible,
                child: Column(
                  children: subItems,
                )),
          ),
        ]);
  }
}

class SubNavItem extends StatefulWidget {
  final subTab;
  SubNavItem({@required this.subTab});

  @override
  _SubNavItemState createState() => _SubNavItemState();
}

class _SubNavItemState extends State<SubNavItem> {

  @override
  Widget build(BuildContext context) {
  print(widget.subTab);

    return Row(
      children: <Widget>[
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Text(widget.subTab['title']),
          ),
          onTap: (){
            print(widget.subTab['route_path']);
          },
        ),
      ],
    );
  }
}
