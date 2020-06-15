import 'package:flutter/material.dart';
import 'package:tori_mobile/components/moleculs/AppDrawer.dart';
import '../state/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // print(menuData);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
