import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;

         String scannedValue = result!.code.toString();

  if (isValidUrl(scannedValue)) {
    launch(scannedValue); // Launch the URL if it's a valid URL
  } else if (isValidEmail(scannedValue)) {
    launch('mailto:$scannedValue'); // Launch email if it's a valid email address
  }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              child: QRView(key: _gLobalkey, onQRViewCreated: qr),
            ),
         
          ],
        ),
      ),
    );
  }
}

bool isValidUrl(String input) {
  final Uri? uri = Uri.tryParse(input);
  return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
}
bool isValidEmail(String input) {
  return input.contains('@');
}