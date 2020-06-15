import 'package:flutter/material.dart';
import 'package:tori_mobile/utils/validator/input_validator.dart';
import '../../components/atoms/input_password.dart';
import '../../components/atoms/input_email.dart';
import '../../components/atoms/button.dart';
import '../../network/api.dart';
import './login_utils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final inputValidator =
      InputValidator(steps: [InputValidator().require, InputValidator().email]);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'TORI',
            style: TextStyle(fontSize: 35.0),
          ),
        ],
      )),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InputEmail(validator: inputValidator.stepByStep),
              SizedBox(height: 30.0),
              InputPassword(),
              SizedBox(height: 30.0),
              Button(
                label: "Sign In",
                onTap: () async {
                  bool resultValidate = _formKey.currentState.validate();
                  if (!resultValidate) return;
                  const String url = 'https://dev.tori.one/login/';
                  Api api = Api();
                  var response = await api.postResponse(url, {
                    '_csrf_token':
                        'TgRXUMvJl2qP21nrumtxfspGjbS4KJVr8LtPLvDg3mk',
                    '_username': 'demo@toriapps.com',
                    '_password': 'Demo2019!',
                    'submitBtn': 'on'
                  });
                  var data = response['data'];
                  separateStartPage(data);

                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}