import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:walatic/MQTT_CONNECTORS/pres_connector.dart';
import 'package:walatic/MQTT_CONNECTORS/termocuple_connector.dart';




class Termocuple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
          StreamBuilder(
            stream: TermocupleProvider().client.updates,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("WITHOUT CONNECTION");
                case ConnectionState.waiting:
                  return Text("WAITING");
                case ConnectionState.active:
                case ConnectionState.done:

                  final c = snapshot.data;
                  final recMess = c![0].payload as MqttPublishMessage;
                  final pt = MqttPublishPayload.bytesToStringAsString(
                      recMess.payload.message);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 100,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                          RadialAxis(
                            minimum: -40,
                            maximum: 200,
                            showLabels: false,
                            showTicks: false,
                            startAngle: 270,
                            endAngle: 270,
                            axisLineStyle: AxisLineStyle(
                              thickness: 1,
                              color: Colors.lightGreen,
                              thicknessUnit: GaugeSizeUnit.factor,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: double.parse(pt),
                                width: 0.15,
                                color: Colors.blue,
                                pointerOffset: 0.1,
                                cornerStyle: CornerStyle.bothCurve,
                                sizeUnit: GaugeSizeUnit.factor,
                              )
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                              positionFactor: 0.50,
                              angle: 90,
                              widget: Container(
                                alignment:Alignment.center,
                                child: Center(
                                  
                                  child: Text(
                                  ' $pt',
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              )),
                               GaugeAnnotation(
                              positionFactor:2 ,
                              angle: 90,
                              widget: Container(
                                alignment:Alignment.center,
                                child: Center(
                                  
                                  child: Text(
                                  ' Termocupla',
                                  style: TextStyle(fontSize: 16, color: Colors.blue),
                                  ),
                                ),
                              ))
                            ],
                                             
                          ),
                          
                          
                          ]

                          )
                       
                      ),
                      
                  );
                 
              } 

            },
          );
     
  }
}
