import 'package:flutter/material.dart';
import 'package:walatic/UI/GLOBAL_WIDGETS/humidity.dart';
import 'package:walatic/UI/GLOBAL_WIDGETS/pressure.dart';
import 'package:walatic/UI/GLOBAL_WIDGETS/super_floating_action.dart';
import 'package:walatic/UI/GLOBAL_WIDGETS/temperature.dart';
 
class HomePage extends StatelessWidget {
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