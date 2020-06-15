import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../pages/Login/index.dart';
import '../pages/Home.dart';

Map<String, Widget Function(BuildContext)>  routes = {
  '/': (context) => HomePage(),
  '/login': (context) => Login(),
};
