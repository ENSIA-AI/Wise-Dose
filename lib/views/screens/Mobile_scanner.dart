import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerPage extends StatefulWidget {
  final Function(String) onScanned;

  const MobileScannerPage({super.key, required this.onScanned});

  @override
  State<MobileScannerPage> createState() => _MobileScannerPageState();
}

class _MobileScannerPageState extends State<MobileScannerPage> {
  MobileScannerController? controller;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _handleDetection(BarcodeCapture capture) async {
    final barcode = capture.barcodes.first;
    if (barcode.rawValue != null) {
      controller?.stop();
      widget.onScanned(barcode.rawValue!);
      
      await Future.delayed(const Duration(milliseconds: 1000));
      //if (mounted) {
        // Navigator.pop(context);
      //}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: controller,
        onDetect: _handleDetection,
      ),
    );
  }
}