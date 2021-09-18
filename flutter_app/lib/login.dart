import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'main.dart';
// Create storage
final storage = new FlutterSecureStorage();

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String> _authUserSign(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      var url = Uri.parse('https://frozen-tundra-73649.herokuapp.com/api/users/login');
      var response = await http.post(url, body: {'email': data.name, 'password': data.password});
      print(response.body);
      final body = json.decode(response.body);
      storage.write(key: "jwt", value: body['accessJWT']);
      if (response.statusCode != 200 && response.statusCode != 201) {
        return 'Email and/or password is invalid';
      }
      return "";
    });
  }

  Future<String> _authUserCreate(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      var url = Uri.parse('https://frozen-tundra-73649.herokuapp.com/api/users/register');
      var response = await http.post(url, body: {'email': data.name, 'password': data.password});
      print(response.body);
      final body = json.decode(response.body);
      storage.write(key: "jwt", value: body['accessJWT']);
      if (response.statusCode != 200 && response.statusCode != 201) {
        return 'Password does not match';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Spur',
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUserSign,
      onSignup: _authUserCreate,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
      }, onRecoverPassword: (String ) {  },
    );
  }
}

// https://pub.dev/packages/flutter_login