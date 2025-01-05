import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_dose/views/screens/mobile_scanner.dart';
import 'package:wise_dose/views/themes/style_simple/colors.dart';
import 'package:wise_dose/views/themes/style_simple/styles.dart';
import 'package:wise_dose/views/widgets/app_bar.dart';
import 'package:wise_dose/views/widgets/gradient_button.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  // Medication data map
  final Map<String, String> medicationData = {
    '12345': 'Headache, dizziness, nausea.',
    '67890': 'Dry mouth, drowsiness, upset stomach.',
    '11223': 'Fatigue, blurred vision, mild rash.'
  };

  void _handleScannedCode(String result) {
    // Show side effects dialog after scanning
    _showSideEffects(result);
    print("barcode ===== $result");
  }

  void _showSideEffects(String medicationCode) {
    final sideEffects = medicationData[medicationCode] ?? 
        'No side effects found for this medication.';

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Side Effects',
                style: boldStandardText,
              ),
              const SizedBox(height: 15),
              Text(
                sideEffects,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor:   Color.fromRGBO(242, 245, 246, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'OK',
                  style:orangeBoldParagraphText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          getAppBar(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  'Scanner',
                  style: boldHeaderText,
                ),
                const SizedBox(height: 30),
                SvgPicture.asset("assets/images/qr-code-scan.svg"),
                const SizedBox(height: 24),
                Text(
                  'Scan your medications directly and avoid filling boring forms!',
                  style: standardText,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                GradientButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MobileScannerPage(
                          onScanned: _handleScannedCode,
                          
                        ),
                      ),
                    );
                  },
                  text: "Scan now",
                  gradient: buttonColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}