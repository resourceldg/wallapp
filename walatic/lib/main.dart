
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:realwallapp/UI/app.dart';



import 'MQTT_CONNECTORS/cpl_connector.dart';
import 'MQTT_CONNECTORS/hum_connector.dart';
import 'MQTT_CONNECTORS/hum_suelo_connector.dart';
import 'MQTT_CONNECTORS/pres_connector.dart';
import 'MQTT_CONNECTORS/temp_connector.dart';
import 'MQTT_CONNECTORS/termocuple_connector.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  await TempProvider().init();
  await PresProvider().init();  
  await HumProvider().init();
  await CplProvider().init();
  await HumSueloProvider().init();
  await TermocupleProvider().init(); 

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);



  runApp(
    
    
      MyApp());
}