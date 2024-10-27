import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:gal/gal.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class QrWidget extends StatefulWidget {
  final String data;

  const QrWidget({
    required this.data,
    super.key,
  });

  @override
  State<QrWidget> createState() => _QrWidgetState();
}

class _QrWidgetState extends State<QrWidget> {
  bool toAlbum = false;

  @protected
  late QrImage qrImage;

  @override
  void initState() {
    super.initState();

    final qrCode = QrCode.fromData(
      data: widget.data,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Column(
        children: [
          PrettyQrView(
            qrImage: qrImage,
          ),
          ElevatedButton(
            onPressed: () async {
              //Gal.open();

              final qrImageBytes = await qrImage.toImageAsBytes(
                size: 512,
                format: ImageByteFormat.png,
                decoration: const PrettyQrDecoration(),
              );
              final buffer = qrImageBytes!.buffer;
              final bytes = buffer.asUint8List(
                  qrImageBytes.offsetInBytes, qrImageBytes.lengthInBytes);
              await Gal.putImageBytes(bytes, album: "QR_code", name: "qr");
              showSnackbar();
            },
            child: const Text('Save Image from bytes'),
          )
        ],
      ),
    );
  }

  String? get album => toAlbum ? 'Album' : null;

  void showSnackbar() {
    final context = navigatorKey.currentContext;
    if (context == null || !context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Saved! ✅'),
      action: SnackBarAction(
        label: 'Gallery ->',
        onPressed: () async => Gal.open(),
      ),
    ));
  }

  Future<Uint8List> getBytesData(String path) async {
    final byteData = await rootBundle.load(path);
    final uint8List = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return Uint8List.fromList(uint8List);
  }
}
