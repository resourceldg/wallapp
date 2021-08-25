import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walatic/UI/PAGES/home_page.dart';



import 'MQTT_CONNECTORS/hum_connector.dart';
import 'MQTT_CONNECTORS/pres_connector.dart';
import 'MQTT_CONNECTORS/temp_connector.dart';
import 'UI/PAGES/splash.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TempProvider().init();
  await PresProvider().init();
  await HumProvider().init();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
     return  MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash',
        routes:{
          'splash': (context)=>Splash()  
        },
      ); 
    /* return  MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes:{
          'home': (context)=>HomePage()  
        },
      ); */
  
  }
}