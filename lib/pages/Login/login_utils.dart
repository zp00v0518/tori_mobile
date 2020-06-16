import 'dart:convert';
import 'package:html/parser.dart' show parse;
import '../../state/index.dart';

void separateStartPage(data) {
  getMenuData(data);
  getUserData(data);
}

void getMenuData(data) {
  Pattern pattern = r'\[.{0,}\]';
  RegExp regex = new RegExp(pattern);
  data = data.replaceAll('&quot;', '\"');
  data = regex.stringMatch(data);
  menuData = jsonDecode(data);
}

void getUserData(data){
  var document = parse(data);
  var userData = document.querySelector('#user-info-img');
  getUserName(userData);
  getUserFoto(userData);
  getUserEmail(userData);
}
void getUserName(userData) {
  var name = userData.querySelector('h3');
  userName = name.innerHtml;
}
void getUserFoto(userData){
  var elem = userData.querySelector('img');
  userFoto = elem.attributes['src'];
}
void getUserEmail(userData){
  var elems = userData.querySelectorAll('a');
  userEmail = elems[1].innerHtml;
}
