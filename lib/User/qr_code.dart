import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class QRCodeScannerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  String result = "Scan a QR Code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(result),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                ScanResult scanResult = await BarcodeScanner.scan();
                setState(() {
                  result = scanResult.rawContent ?? "Scan failed!";
                });
              },
              child: Text('Start Scan'),
            ),
          ],
        ),
      ),
    );
  }
}
