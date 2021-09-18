import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'promo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
final box = GetStorage();

class Scan extends StatefulWidget {
  static var name = "";
  static var description = "";
  static var icon = "";
  static var promo = "";
  static var website = "";


  @override
  State<Scan> createState() => _BirdState();
}

class _BirdState extends State<Scan> {
  double _size = 1.0;

  void grow() {
    setState(() { _size += 0.1; });
  }

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      await controller.pauseCamera();
      var value = await box.read("jwt");
      setState(() {
        result = scanData;
      });
      print(result!.code);
      var url = Uri.parse('https://frozen-tundra-73649.herokuapp.com/api/codes/${result!.code}');
      var response = await http.get(url);
      print(response.body);
      var body = json.decode(response.body);
      var test3 = (body['code']);
      // var body3 = json.decode(test3.body);

      Scan.name =  test3["name"];
      Scan.description =  test3["description"];
      Scan.icon = test3["image"];
      Scan.promo = test3["promoText"];
      Scan.website = test3["website"];
      // // print(Scan.name);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Promo()),
      );

    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


}