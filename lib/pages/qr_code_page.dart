import 'package:black_theory/providers/global_providers.dart';
import 'package:black_theory/repositories/rest_clients_repository.dart';
import 'package:black_theory/utils/global_colors.dart';
import 'package:black_theory/utils/global_constants.dart';
import 'package:black_theory/widgets/global_drawer.dart';
import 'package:black_theory/widgets/global_neon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/global_functions.dart';

class QrCodePage extends ConsumerStatefulWidget {

  const QrCodePage({super.key});

  static const String route = '/';

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
  void initState() {

    // Retrieve the current selected client id and token
    final Map<String, dynamic> generationFieldsState = ref.read(generationFieldsStatusProvider);
    final int clientId = int.parse(generationFieldsState[GlobalConstants.stateClientIdKey]);
    final String token = generationFieldsState[GlobalConstants.stateTokenKey];

    // Retrieve the expiration date of the selected client id
    RestClientsRepository.checkExpirationDateRestClient.checkExpirationDateOfClientId(clientId, token).then((String response) {
      final DateTime expirationDate = GlobalFunctions.retrieveExpirationDateFromResponse(response);
      ref.read(expirationCheckMapProvider.notifier).add(clientId, expirationDate);
    });

    super.initState();
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

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [

                    TextSpan(
                      text: 'Accedi ',
                      style: TextStyle(
                        color: GlobalColors.primaryNeonGreenColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.25,
                      ),
                    ),

                    TextSpan(
                      text: 'a tutti i centri, ',
                      style: TextStyle(
                        color: GlobalColors.secondaryGreenColor,
                        fontSize: 22,
                        letterSpacing: 1.25,
                      ),
                    ),

                    TextSpan(
                      text: 'Sfrutta\n',
                      style: TextStyle(
                        color: GlobalColors.primaryNeonGreenColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.25,
                      ),
                    ),

                    TextSpan(
                      text: 'i tuoi Crediti usando questo\nQrCode',
                      style: TextStyle(
                        color: GlobalColors.secondaryGreenColor,
                        fontSize: 22,
                        letterSpacing: 1.25,
                      ),
                    )

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                ),
                child: QrImageView(
                  data: _qrData,
                  gapless: false,
                  padding: EdgeInsets.all(2.5),
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

              GlobalNeonButton(
                text: 'Genera Nuovo QR CODE',
                onPressed: _changeQrCodeData,
                padding: const EdgeInsets.only(
                  top: 25,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDebugWidgets() {

    final Map<String, dynamic> generationFieldsState = ref.watch(generationFieldsStatusProvider);

    final Map<int, dynamic> expirationCheckMapState = ref.watch(expirationCheckMapProvider);
    final int clientId = int.parse(generationFieldsState[GlobalConstants.stateClientIdKey]);

    // Format the retrieved expiration date
    final DateTime? currentClientIdExpirationDate = expirationCheckMapState[clientId];
    String? formattedDateToShow;
    if (currentClientIdExpirationDate != null) {
      formattedDateToShow = DateFormat('dd/MM/yyyy').format(currentClientIdExpirationDate);
    }

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

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Expiration date: ${formattedDateToShow ?? 'SCONOSCIUTO'}",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          if (currentClientIdExpirationDate != null)
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentClientIdExpirationDate.isAfter(DateTime.now())
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
        ],
      ),

    ];
  }

}
