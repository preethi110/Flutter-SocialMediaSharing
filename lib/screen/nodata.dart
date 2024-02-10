import 'package:flutter/material.dart';

class Nodata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Screen'),
        backgroundColor: Color.fromARGB(255, 13, 14, 14),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/nodata.png',
              width: 180,
              height: 180,
            ),
            SizedBox(height: 90),
            Text(
              'No data added yet!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.grey,
                letterSpacing: 1.5,
                wordSpacing: 5,
                decorationThickness: 2,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
