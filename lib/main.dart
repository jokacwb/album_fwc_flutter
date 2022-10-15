import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/config/env/env.dart';
import 'package:fwc_album/fwc_album.dart';

void main() async {
  //Busca as informações do arquivo .env
  await Env.instance.load();
  runApp(FwcAlbum());
}
