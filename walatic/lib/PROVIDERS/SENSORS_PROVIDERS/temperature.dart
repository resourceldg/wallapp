import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:realwallapp/MQTT_CONNECTORS/temp_connector.dart';



class Temperature extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return 
          StreamBuilder(
            stream: TempProvider().client.updates,
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
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 60,
                            height: 300,
                            
                            child: SfLinearGauge(
                                
                                ranges: [
                                  //Changes the color. The start and end values are 0 to 100 by default
                                  LinearGaugeRange(startValue: -40, endValue: 0,color: Colors.lightBlue[100]),
                                  LinearGaugeRange(startValue: 0, endValue: 10,color: Colors.blueAccent),
                                  LinearGaugeRange(startValue: 10, endValue: 30,color: Colors.yellowAccent),
                                  LinearGaugeRange(startValue: 30, endValue: 55,color: Colors.orangeAccent)
                                ],
                                minimum: -40.0,
                                interval: 10,
                                maximum: 55.0,
                                markerPointers: [LinearShapePointer(value: double.parse(pt),color:Colors.red,),],
                                orientation: LinearGaugeOrientation.vertical,
                                majorTickStyle: LinearTickStyle(length: 5),
                                axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
                                axisTrackStyle: LinearAxisTrackStyle(
                                    color: Colors.grey,
                                    edgeStyle: LinearEdgeStyle.bothFlat,
                                    thickness: 7.0,            
                                    borderColor: Colors.grey),
                                
                                
                                ),
                            
                           
                          ),
                          
                      ),
                      Container(
                        child: Text('Temperatura'),
                      )
                    ],
                  );
                 
              } 

            },
          );
     
  }

}
