//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  GoogleMapsPlugin.registerWith(registrar);
  GoogleSignInPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
