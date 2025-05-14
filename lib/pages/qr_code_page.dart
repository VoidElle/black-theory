import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/functions.dart';

class QrCodePage extends StatefulWidget {

  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {

  late String qrData;

  void _changeQrCodeData() {
    final String newData = Functions.retrieveQrCodeData();
    setState(() {
      qrData = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    _changeQrCodeData();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sfondo_app2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                  color: Color(0xFF00FF66),
                  fontSize: 20,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                ),
                child: QrImageView(
                  data: qrData,
                  gapless: false,
                  version: QrVersions.auto,
                  size: 200,
                  backgroundColor: Colors.white,
                ),
              ),

              Text(
                "Client ID: ${qrData.split('&')[0].split('=')[1]}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              Text(
                "Center ID: ${qrData.split('&')[1].split('=')[1]}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              Text(
                "Timestamp: ${qrData.split('&')[2].split('=')[1]}",
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
                    backgroundColor: const Color(0xFF00FF66), // Neon green
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 55),
                    elevation: 10, // Strong shadow/glow
                    shadowColor: const Color(0xFF00FF66).withOpacity(0.5), // Neon green glow
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
