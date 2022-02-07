import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walatic/UI/app.dart';
import 'package:walatic/bloc/auth_cubit.dart';
import 'package:walatic/repository/IMPLEMENTATION/FIREBASE/my_auth_repository.dart';


import 'MQTT_CONNECTORS/cpl_connector.dart';
import 'MQTT_CONNECTORS/hum_connector.dart';
import 'MQTT_CONNECTORS/hum_suelo_connector.dart';
import 'MQTT_CONNECTORS/pres_connector.dart';
import 'MQTT_CONNECTORS/temp_connector.dart';
import 'MQTT_CONNECTORS/termocuple_connector.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

  final authCubit = AuthCubit(AuthRepository());

  runApp(
    BlocProvider(
      create: (_) => authCubit..init(),
      child: MyApp.create(),
    ),
  );
}
