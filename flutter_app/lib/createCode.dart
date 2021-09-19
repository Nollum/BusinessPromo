import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

// final storage = new FlutterSecureStorage();
final box = GetStorage();

class CreateCode extends StatefulWidget {


  @override
  State<CreateCode> createState() => _CreateCode();
}

class _CreateCode extends State<CreateCode> {

  final box = GetStorage();

  var qrCode = "";

  @override
  void initState(){

    controller1.text = box.read("name") ?? "";
    controller2.text = box.read("description") ?? "";
    controller3.text = box.read("image") ?? "" ;
    controller4.text = box.read("promoText") ?? "";
    controller5.text = box.read("website") ?? "";

  }
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text('Create QR Code'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller1,
              decoration: const InputDecoration(
                icon: Icon(Icons.business_center_outlined),
                // hintText: 'What do people call you?',
                labelText: 'Title',
              ),
              validator: (password) {
                if (false) return null;
                else
                  return 'Enter a valid password';
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller2,
              decoration: const InputDecoration(
                icon: Icon(Icons.description),
                // hintText: 'What do people call you?',
                labelText: 'Description',
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
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller3,
              decoration: const InputDecoration(
                icon: Icon(Icons.image),
                // hintText: 'What do people call you?',
                labelText: 'Image/icon',
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
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller4,
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money),
                // hintText: 'What do people call you?',
                labelText: 'Promotion Text',
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
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller5,
              decoration: const InputDecoration(
                icon: Icon(Icons.link),
                // hintText: 'What do people call you?',
                labelText: 'Website',
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
            child: const Text('Create QR Code',style: TextStyle(fontSize: 24)),
            style: ElevatedButton.styleFrom (
              elevation: 0,
              primary: Colors.yellow[700],
              onPrimary: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              // fixedSize: Size(200, 70),

            ),

            onPressed: () async {
              var url = Uri.parse('https://frozen-tundra-73649.herokuapp.com/api/codes');
              // var value = storage.read(key: 'jwt');
              var value = await box.read("jwt");

              print(value);
              box.write("name", controller1.text);
              box.write("description", controller2.text);
              box.write("image", controller3.text);
              box.write("promoText", controller4.text);
              box.write("website", controller5.text);

              var response = await http.post(url, body: {'name': controller1.text, 'description': controller2.text, 'image': controller3.text, 'promoText': controller4.text, 'website': controller5.text,'jwt': value});
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              print(response.body);
              var body = json.decode(response.body);
              var test3 = (body['code']);
              // var body3 = json.decode(test3.body);

              qrCode = test3["_id"];

              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    // elevation: 16,
                    child: Container(
                      height: 400,
                      child: Column(
                        children: [
                          QrImage(
                            data: qrCode,
                            // version: QrVersions.auto,
                            // size: 200.0,
                            // gapless: false,
                            // embeddedImage: AssetImage('Graphics/Spur_Logo.png'),
                            // embeddedImageStyle: QrEmbeddedImageStyle(
                            //   size: Size(80, 80),
                            // ),

                          ),
                          ElevatedButton(
                            // style: raisedButtonStyle,
                            style: ElevatedButton.styleFrom (
                              elevation: 0,
                              primary: Colors.yellow[700],
                              onPrimary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              // fixedSize: Size(200, 70),

                            ),
                            onPressed: () {
                              launch("https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${qrCode}");
                            },
                            child: Text('Save',style: TextStyle(fontSize: 24)),
                          )

                        ],
                      ),


                    ),
                  );
                },
              );

              //_id
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