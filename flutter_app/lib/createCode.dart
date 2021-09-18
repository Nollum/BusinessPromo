import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';

class CreateCode extends StatefulWidget {


  @override
  State<CreateCode> createState() => _CreateCode();
}

class _CreateCode extends State<CreateCode> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Title'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.business_center_outlined),
                // hintText: 'What do people call you?',
                labelText: 'Business Name',
              ),
              validator: (password) {
                if (false) return null;
                else
                  return 'Enter a valid password';
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.description),
                // hintText: 'What do people call you?',
                labelText: 'Business Description',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != "" ? 'Please enter a value' : null);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money),
                // hintText: 'What do people call you?',
                labelText: 'Business Promotion',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != "" ? 'Please enter a value' : null);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.link),
                // hintText: 'What do people call you?',
                labelText: 'Business Website',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },

              validator: (String? value) {
                return ((value!.length > 3) ? 'Please enter a value' : null);
              },
            ),
          ),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Scan()),
              // );
            },
          ),



        ],

      ),
    );
  }

// Widget _buildQrView(BuildContext context) {
//   // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//   var scanArea = (MediaQuery.of(context).size.width < 400 ||
//       MediaQuery.of(context).size.height < 400)
//       ? 150.0
//       : 300.0;
//   // To ensure the Scanner view is properly sizes after rotation
//   // we need to listen for Flutter SizeChanged notification and update controller
//   return Container(
//     child:
//
//   )
// }



}