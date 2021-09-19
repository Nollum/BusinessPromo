import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'main.dart';
import 'package:get_storage/get_storage.dart';
// Create storage
// final storage = new FlutterSecureStorage();
final box = GetStorage();

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUserSign(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      var url = Uri.parse(
          'https://frozen-tundra-73649.herokuapp.com/api/users/login');
      var response = await http.post(
          url, body: {'email': data.name, 'password': data.password});
      print(response.body);
      final body = json.decode(response.body);
      print(body['accessJWT']);
      print("II");

      box.write("jwt", body['accessJWT']);
      print(box.read("jwt"));

      if (response.statusCode != 200 && response.statusCode != 201) {
        return 'Email and/or password is invalid';
      }
      return "";
    });
  }

  Future<String> _authUserCreate(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      var url = Uri.parse(
          'https://frozen-tundra-73649.herokuapp.com/api/users/register');
      var response = await http.post(
          url, body: {'email': data.name, 'password': data.password});
      print(response.body);
      final body = json.decode(response.body);
      print(body['accessJWT']);
      box.write("jwt", body['accessJWT']);
      // storage.write(key: "jwt", value: body['accessJWT']);
      if (response.statusCode != 200 && response.statusCode != 201) {
        // String value = await storage.read(key: key);

        return 'Password does not match';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: ("\$pur"),

      theme: LoginTheme(
        primaryColor: Colors.yellow[100],
        errorColor: Colors.deepOrange,
        titleStyle: TextStyle(
          color: Colors.yellow[700],
        ),
        textFieldStyle: TextStyle(
          color: Colors.black,
        ),
        buttonStyle: TextStyle(
          color: Colors.black,
        ),
        cardTheme: CardTheme(
          color: Colors.yellow.shade700,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
        ),
      ),
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUserSign,
      onSignup: _authUserCreate,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
      },
      onRecoverPassword: (String) {},
    );
  }
}

// https://pub.dev/packages/flutter_login