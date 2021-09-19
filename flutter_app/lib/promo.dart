import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'scan.dart';
import 'package:flutter/cupertino.dart';

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xfffbc02d)
      ..style = PaintingStyle.fill;
    //a rectangle
    //canvas.drawRect(Offset(30, 30) & Size(150, 45), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

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
        backgroundColor: Color(0xfffBC02D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[

          Container (
            margin: EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              //borderRadius: new BorderRadius.circular(30.0),
              //color: Colors.white,

            ),

            child: Image.network('${Scan.icon}'),
          ),

          Container(
            //width: 250,
            //height: 50,
          margin: EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
             //borderRadius: new BorderRadius.circular(30.0),
              //color: Colors.white,

            ),


            child: RichText(

              text: TextSpan(
                children: <TextSpan>[

                  TextSpan(text: 'Description',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.yellow[700],
                        fontSize: 25,
                      )),
                  // TextSpan(
                  //     text: '${Scan.description} \n\n\n',
                  //     style: TextStyle(fontWeight: FontWeight.normal,
                  //       color: Colors.black,
                  //       fontSize: 24,
                  //     )),
                  // TextSpan(text: 'Promotion \n',
                  //     style: TextStyle(fontWeight: FontWeight.normal,
                  //       color: Colors.black,
                  //       fontSize: 12,
                  //     )),
                  // TextSpan(text: '${Scan.promo} \n \n',
                  //   style: TextStyle(fontWeight: FontWeight.normal,
                  //     color: Colors.black,
                  //     fontSize: 24,
                  //   ),
                  // ),
                  // TextSpan(
                  //   text: 'More Information',
                  //   style: TextStyle(color:Colors.lightBlue, fontWeight: FontWeight.normal, fontSize: 24, decoration: TextDecoration.underline),
                  //   recognizer: new TapGestureRecognizer()..onTap = () {
                  //     launch("${Scan.website}");
                  //   },
                  // ),



                ],
              ),

              ),

            ),

            Container (
              margin: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                //borderRadius: new BorderRadius.circular(30.0),
                //color: Colors.white,

              ),

              child:RichText(
                text:TextSpan(
                  children:<TextSpan>[
                    TextSpan(text: '${Scan.description}',
                        style: TextStyle(fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
            ),

            Container (

              margin: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                //borderRadius: new BorderRadius.circular(30.0),
                //color: Colors.white,

              ),

              child: RichText(
                text: TextSpan (
                  children:<TextSpan>[
                    TextSpan(text: 'Promotion',
                        style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.yellow[700],
                          fontSize: 25,
                        )),
                  ],
                ),
              ),
            ),

          Container (
            margin: EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              //borderRadius: new BorderRadius.circular(30.0),
              //color: Colors.white,

            ),

            child:RichText(
              text:TextSpan(
                children:<TextSpan>[
                  TextSpan(text: '${Scan.promo}',
                      style: TextStyle(fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ),

          // Container (
          //   margin: EdgeInsets.all(10.0),
          //   decoration: new BoxDecoration(
          //     //borderRadius: new BorderRadius.circular(30.0),
          //     //color: Colors.white,
          //
          //   ),
          //
          //   child: new InkWell(
          //       child: new Text('Go to Business Website',
          //           style: TextStyle(color: Colors.blue[300]),
          //       ),
          //       onTap: () => launch('https://google.com')
          //   ),
          // ),


          Container (
            margin: EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              //borderRadius: new BorderRadius.circular(30.0),
              //color: Colors.white,

            ),

            child:RichText(
              text:TextSpan(
                children:<TextSpan>[
                  TextSpan(text: 'Total Visits: ${Scan.scans} ',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.yellow[700],
                        fontSize: 25,
                      )),
                ],
              ),
            ),

          ),

          ElevatedButton(
            child: const Text(
              'More Info',
              style: TextStyle(fontSize: 25),
            ),

            style: ElevatedButton.styleFrom (
              primary: Colors.yellow[700],
              onPrimary: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              fixedSize: Size(200, 70),

            ),
            onPressed: () {
              if(Scan.website.indexOf("http") >= 0) {
                print(Scan.website);
                print("LOL");
                launch("${Scan.website}");
              }
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