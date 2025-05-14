import 'package:black_theory/utils/global_colors.dart';
import 'package:black_theory/widgets/global_drawer.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/functions.dart';

class QrCodePage extends StatefulWidget {

  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {

  // QR code data
  late String _qrData;

  // Device sizes
  double? _deviceHeight;
  double? _deviceWidth;

  // Function to change QR code data
  void _changeQrCodeData() {
    final String newData = Functions.retrieveQrCodeData();
    setState(() {
      _qrData = newData;
    });
  }

  @override
  void initState() {
    _qrData = Functions.retrieveQrCodeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Initialize device sizes
    // (Cannot be done in initState because of context)
    if (_deviceHeight == null || _deviceWidth == null) {
      final Size deviceSize = MediaQuery.of(context).size;
      _deviceHeight = deviceSize.height;
      _deviceWidth = deviceSize.width;
    }

    return Scaffold(
      drawer: SizedBox(
        width: _deviceWidth,
        child: GlobalDrawer(),
      ),
      drawerEdgeDragWidth: _deviceWidth,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sfondo_app2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: _deviceHeight,
        width: _deviceWidth,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                ),
                child: Image.asset(
                  "assets/greentheory.png",
                  height: 100,
                ),
              ),

              Text(
                "Accedi a tutti i centri, Sfrutta\ni tuoi Crediti usando questo \nQrCode",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GlobalColors.primaryNeonGreenColor,
                  fontSize: 20,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                ),
                child: QrImageView(
                  data: _qrData,
                  gapless: false,
                  version: QrVersions.auto,
                  size: 200,
                  backgroundColor: Colors.white,
                ),
              ),

              Text(
                "Client ID: ${_qrData.split('&')[0].split('=')[1]}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              Text(
                "Center ID: ${_qrData.split('&')[1].split('=')[1]}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              Text(
                "Timestamp: ${_qrData.split('&')[2].split('=')[1]}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                child: ElevatedButton(
                  onPressed: _changeQrCodeData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.primaryNeonGreenColor, // Neon green
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 55,
                    ),
                    elevation: 10, // Strong shadow/glow
                    shadowColor: GlobalColors.primaryNeonGreenColor.withValues(
                      alpha: 0.5,
                    ), // Neon green glow
                  ),
                  child: const Text(
                    'Genera Nuovo QR CODE',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // For contrast on green
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
