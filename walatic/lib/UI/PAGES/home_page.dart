

import 'package:flutter/material.dart';

import 'package:walatic/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.darkOff,
      appBar: AppBar(
        
        title:
          Center(
            child: 
              Text('WallaUser',
                style: TextStyle(
                      color: CustomTheme.secundary),
              ),
          ),
          
        toolbarHeight: 100,
        elevation : 15 ,
        backgroundColor: CustomTheme.darkOn,
        actions: [
          Container(
            
            width: 50,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/img/wabit_.jpg'),
              
              
            ),
          
          ),
          SizedBox(
                width: 20,
              ),
          Icon(Icons.more_vert),
        ],//actions
      ),
      body: Container(
        
        child: Column(
           
            children:[
              
              Text('DarkLightText',
                      style: TextStyle(
                      color: CustomTheme.DarkLightText
                      ),
              ),
            ],
          ),
      ),
    );
  }
}