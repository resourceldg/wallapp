import 'package:flutter/material.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/humidity.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/pressure.dart';
import 'package:walatic/UI/ATOM_WIDGETS/super_floating_action.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/temperature.dart';
 
class SensorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text (' lola'),
      ),
      body: 
      Center(
        child: Column(
          children: [
            Temperature(),
            Pressure(),
            Humidity()
          ],
        ),
      ),

      floatingActionButton: SuperFloatingAction(),
    );
  }
}