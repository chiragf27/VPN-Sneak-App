import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/helpers/my_dialogs.dart';
import 'dart:ui';
import '../helpers/pref.dart';
import '../models/vpn.dart';
import '../models/vpn_config.dart';
import '../services/vpn_engine.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController{

  final Rx<Vpn> vpn = Pref.vpn.obs;

  final vpnState = VpnEngine.vpnDisconnected.obs;

  

  void connectToVpn() {
    if (vpn.value.openVPNConfigDataBase64.isEmpty) {
      MyDialogs.info(msg: 'Select a Location by clicking \'Change Location\'');
      return;
    };

    if (vpnState.value == VpnEngine.vpnDisconnected) {

      final data = Base64Decoder().convert(vpn.value.openVPNConfigDataBase64);

      final config = Utf8Decoder().convert(data);
      final vpnConfig = VpnConfig(country: vpn.value.countryLong, username: 'vpn', password: 'vpn', config: config);

      ///Start if stage is disconnected
      
      VpnEngine.startVpn(vpnConfig);
    } else {
      ///Stop if stage is "not" disconnected
      
      VpnEngine.stopVpn();
    }
  }
  // vpn buttons color 
  Color get getButtonColor {
    switch (vpnState.value){
      case VpnEngine.vpnDisconnected: 
        return Colors.blue; 
      case VpnEngine.vpnConnected: 
        return Colors.green;
      default: 
        return Colors.redAccent;
    }
  }

  // vpn button text
  String get getButtonText {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return 'Tap to Connect';

      case VpnEngine.vpnConnected:
        return 'Disconnect';

      default:
        return 'Connecting';
    }
  }

}