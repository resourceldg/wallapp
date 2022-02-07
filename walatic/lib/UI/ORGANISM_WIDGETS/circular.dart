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
          scrollDirection:Axis.vertical ,
            
                child: 
                    Container(
                    padding: const EdgeInsets.all(5.0),
                      child:
                        Wrap(
                          alignment: WrapAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    
                                  
                                          Expanded(
                                            
                                            child: Container(
                                              width: 40,
                                              child: Column(
                                                children: [
                                                  Temperature(),
                                                ],
                                              ),
                                            ),
                                          ),  
                                       
                                    
                                
                                        Column(
                                          
                                          children: [
                                            Row(
                                              children: [
                                                Humidity(),
                                                Pressure()   
                                              ],
                                            ),
                                            Row(
                                              children: [
                                              Suelo(),
                                              Termocuple(),
                                              Cpl()   
                                              ],
                                            ),                                                                 
                                    
                                          ],
                                          
                                        ), 
                                                                                                      
                                  ],
                                ),   
                              ], //children
                        )
                    ),
      ),
    ),
    );
  }
}
 
