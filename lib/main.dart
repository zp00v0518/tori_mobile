import 'package:flutter/material.dart';
import './routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: 'TORI',
      initialRoute: '/login',
      routes: routes,
    );
  }
}
