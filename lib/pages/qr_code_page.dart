import 'package:black_theory/providers/global_providers.dart';
import 'package:black_theory/utils/global_colors.dart';
import 'package:black_theory/utils/global_constants.dart';
import 'package:black_theory/widgets/global_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/global_functions.dart';

class QrCodePage extends ConsumerStatefulWidget {

  const QrCodePage({super.key});

  @override
  ConsumerState<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends ConsumerState<QrCodePage> {

  // QR code data
  late String _qrData;

  // Device sizes
  double? _deviceHeight;
  double? _deviceWidth;

  // Function to change QR code data
  void _changeQrCodeData() {
    final Map<String, dynamic> generationFieldStatusProviderState = ref.read(generationFieldsStatusProvider);
    final String newData = GlobalFunctions.retrieveQrCodeData(generationFieldStatusProviderState);
    setState(() {
      _qrData = newData;
    });
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> generationFieldStatusProviderState = ref.watch(generationFieldsStatusProvider);
    _qrData = GlobalFunctions.retrieveQrCodeData(generationFieldStatusProviderState);

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

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final bool stealthMode = ref.watch(stealthModeStatusProvider);
                  return Visibility(
                    visible: !stealthMode,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildDebugWidgets(),
                    ),
                  );
                },
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

  List<Widget> _buildDebugWidgets() {
    final generationFieldsState = ref.watch(generationFieldsStatusProvider);
    return [

      Text(
        "Client ID: ${generationFieldsState[GlobalConstants.stateClientIdKey]}",
        style: TextStyle(
          color: Colors.white,
        ),
      ),

      Text(
        "Center ID: ${generationFieldsState[GlobalConstants.stateCenterIdKey]}",
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

      SizedBox(
        height: 25,
      ),

      Text(
        "Token: ${generationFieldsState[GlobalConstants.stateTokenKey]}",
        style: TextStyle(
          color: Colors.white,
        ),
      ),

    ];
  }

}
