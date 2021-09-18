import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// this must be changed to idk... well figure it out
const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String> _authUserSign(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      Future<http.Response> x = http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/albums'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Name': data.name,
          'Pass': data.password
        }),
      );
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return "";
    });
  }

  Future<String> _authUserCreate(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      Future<http.Response> x = http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/albums'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Name': data.name,
          'Pass': data.password
        }),
      );
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return "";
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
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
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => DashboardScreen(),
        // ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}

// https://pub.dev/packages/flutter_login