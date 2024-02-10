import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ufo/ui/buttondesign.dart';
import 'package:ufo/model/User.dart';

class QrCodeQenerator extends StatefulWidget {
  final User user;

  String data;

  QrCodeQenerator({Key? key, required this.user, required this.data})
      : super(key: key);

  @override
  State<QrCodeQenerator> createState() => _QrCodeQeneratorState();
}

class _QrCodeQeneratorState extends State<QrCodeQenerator> {
  @override
  Widget build(BuildContext context) {
    String data = widget.data;

    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: QrImageView(
                    data: data,
                    backgroundColor: Colors.white,
                    version: QrVersions.auto,
                    size: 250.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                const Text(
                  'Lets get you connected!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
