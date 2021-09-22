import 'package:flutter/material.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/cpl.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/humidity.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/pressure.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/suelo.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/temperature.dart';
import 'package:walatic/PROVIDERS/SENSORS_PROVIDERS/termocuple.dart';




class Circular  extends StatefulWidget {
  static Widget create(BuildContext context) => Circular();
  
  @override
  _Circular createState() => _Circular();
}

class _Circular    extends State<Circular> {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.8),
      child: Scaffold(
        body: SingleChildScrollView(
            
                child: 
                    Container(

                      child:
                        Wrap(
                          
                          children: [
                            Row(
                              children: [
                                Temperature(),
                                Humidity(),
                                Pressure()     
                              ],
                            
                            ),
                            Row(
                              children: [
                                Suelo(),
                                Cpl(),
                                Termocuple()                 
                              ],
                            
                            ),
                          ]  
                        ),
                   
                    ),
                   
              ),
      ),
    );
  }
}
 
