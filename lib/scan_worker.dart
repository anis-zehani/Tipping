import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'app_bar.dart';
import 'drawer.dart';
import 'tip_worker.dart';

class ScanWorkerPage extends StatelessWidget {
  const ScanWorkerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 35, 75, 121)),
      ),
      home: Scaffold(
        appBar: AppBarPage(title: 'Scan a worker'),
        drawer: const DrawerPage(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100),
              IconButton(
                iconSize: 400.0,
                icon: const Icon(Icons.qr_code_2_sharp),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QRViewTipping(),
                  ));
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QRViewTipping(),
                  ));
                },
                child: Text(
                  'Tap to scan a worker\'s QR code',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QRViewTipping extends StatefulWidget {
  const QRViewTipping({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewTippingState();
}

class _QRViewTippingState extends State<QRViewTipping> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 35, 75, 121)),
      ),
      home: Scaffold(
        appBar: AppBarPage(title: 'QR Code Scanner'),
        drawer: const DrawerPage(),
        body: Column(
          children: <Widget>[
            Expanded(flex: 4, child: _buildQrView(context)),
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (result != null)
                      Text(
                        'Data = ${result!.code}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == false) {
                                    return Text(
                                      'Turn on flash light',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    );
                                  } else {
                                    return Text(
                                      'Turn off flash light',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    );
                                  }
                                },
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color.fromARGB(255, 218, 243, 74),
          borderRadius: 10,
          borderLength: 70,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      String qrCode = scanData.code.toString();

      setState(() {
        result = scanData;
      });

      Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => TipWorkerPage(
                      qrCode: qrCode,
                      workerName: 'Anis Zehani',
                      imageUrl:
                          'https://pbs.twimg.com/profile_images/1630389794806157313/AFcZmyjf_400x400.jpg')))
          .then((value) => controller.resumeCamera());
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
