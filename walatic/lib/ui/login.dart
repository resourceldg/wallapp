import 'package:flutter/material.dart';


import 'package:realwallapp/PROVIDERS/api_auth.dart';

import 'package:realwallapp/navigation/routes.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class LoginPage extends StatelessWidget {

  
  static Widget create(BuildContext context) => LoginPage();

  @override
  Widget build(BuildContext context) {
   
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    
    String? emptyValidator(String? value) {
    return (value == null || value.isEmpty) ? 'El campo es requerido' : null;
    }


    return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: (
        
             SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[                    
                  Column(
                        children: 
                          [Text(
                            ' ») Hola Extraño (« ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black45),
                          ),
                        ],
                  ),
                    
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            SizedBox(height: 8),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(labelText: 'Ingresa tu correo'),
                              validator: emptyValidator,
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(labelText: 'Y tu contraseña'),
                              validator: emptyValidator,
                            ),
                            SizedBox(height: 18),
                            Center(
                              child: ElevatedButton(
                                child: const Text('Entrar',style: TextStyle( fontSize: 18)),
                                onPressed: () {                              
                                  if (_formKey.currentState?.validate() == true) {           
                                  ApiAuth().auth(email: _emailController.text, password: _passwordController.text);                                   
                                  _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.circular, (r) => false);
                                       
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            )
      
              
       ),
          ) );
    
   
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;

  const _LoginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.onTap,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 3,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 24,
                height: 24,
              ),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
