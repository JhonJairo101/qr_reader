import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_qr_reader/src/models/scan_model.dart';

abrirScan(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'http') {
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'Could not launch ${scan.valor}';
    }
  } else {
    hablar(scan.valor);
    //Navigator.pushNamed(context, 'mapa', arguments: scan);

  }
}

Future hablar(String texto) async {
  FlutterTts flutterTts = FlutterTts();

  await flutterTts.setLanguage("es-ES");

  await flutterTts.speak(texto);
}
