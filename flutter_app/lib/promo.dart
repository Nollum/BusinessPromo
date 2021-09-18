import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'scan.dart';

class Promo extends StatefulWidget {


  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${Scan.name}'),
        elevation: 0,
        backgroundColor: Color(0xffffAf00),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network('${Scan.icon}'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Business Description \n',
                      style: TextStyle(fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 12,
                      )),
                  TextSpan(
                      text: '${Scan.description} \n\n\n',
                      style: TextStyle(fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 24,
                      )),
                  TextSpan(text: 'Business Promotion \n',
                      style: TextStyle(fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 12,
                      )),
                  TextSpan(text: '${Scan.promo} \n \n',
                      style: TextStyle(fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 24,
                      ),
                  ),
                  TextSpan(
                    text: 'More Information',
                    style: TextStyle(color:Colors.lightBlue, fontWeight: FontWeight.normal, fontSize: 24, decoration: TextDecoration.underline),
                    recognizer: new TapGestureRecognizer()..onTap = () {
                      launch("${Scan.website}");
                    },
                  ),

                ],
              ),
            ),
          )
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