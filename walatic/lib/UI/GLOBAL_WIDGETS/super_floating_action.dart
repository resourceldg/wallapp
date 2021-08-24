import 'package:flutter/material.dart';


class SuperFloatingAction extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
     mainAxisAlignment:MainAxisAlignment.end,
     children: <Widget>[
       FloatingActionButton(
         child: Icon(Icons.play_arrow),
         backgroundColor: Colors.red,
         onPressed:(){},
       ),
       SizedBox(height: 10.0,),
       FloatingActionButton(
         child: Icon(Icons.play_arrow),
         backgroundColor: Colors.blue,
         onPressed:(){

         },
       )

     ],
    );
  }
}
