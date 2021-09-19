

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:walatic/bloc/auth_cubit.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:walatic/navigation/routes.dart';
final _navigatorKey = GlobalKey<NavigatorState>();





class IntroScreen extends StatelessWidget {
  static Widget create(BuildContext context) => IntroScreen();
  String text= GetAppBar.appbar;
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: _IntroPager(),
    );
  }
  
}

class GetAppBar{
  static const String appbar='Bienvenido';
    static setAppbar(String str){
      
    return (appbar);
    } 

}

class _IntroPager extends HookWidget {
  
  final String exampleText =
      'Lorem ipsum dolor sit amet, consecrated advising elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.';

  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;

    return AbsorbPointer(
      absorbing: isSigningIn,
      child: PageIndicatorContainer(
        child: PageView(
          
          children: <Widget>[
            _DescriptionPage(
              text: exampleText,
              imagePath: 'assets/intro_1.png',
            ),
            _DescriptionPage(
              text: exampleText,
              imagePath: 'assets/intro_2.png',
            ),
            _DescriptionPage(
              text: exampleText,
              imagePath: 'assets/intro_3.png',
            ),
             
            _Register(),
          ],
          controller: usePageController(),
        
        ),
        align: IndicatorAlign.top,
        length: 4,
        indicatorSpace: 12,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Colors.blue,
      ),
      
    );
  }
}

class _DescriptionPage extends StatelessWidget {

  
  final String text;
  final String imagePath;

  const _DescriptionPage({
    Key? key,
    required this.text,
    required this.imagePath,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.all(20),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 150,
            height: 150,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Register extends StatefulWidget {
  static Widget create(BuildContext context) => _Register();

  @override
  __RegisterState createState() => __RegisterState();
}

class __RegisterState extends State<_Register> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  
  InputDecoration _buildInputDecoration(String hint) {
  return InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(10, 10, 10, 1))),
      hintText: hint,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(151, 151, 151, 1))),
      hintStyle: TextStyle(color: Color.fromRGBO(10, 10, 10, 1)),
      errorStyle: TextStyle(color: Color.fromRGBO(243,16,8,1)),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Color.fromRGBO(243,16,8,1))),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Color.fromRGBO(243,16,8,1))));
}

  Widget _buildEmail() {
  return TextFormField(
    validator: (value) => !isEmail(value!) ? "ERROR: Formato de correo inválido" : null,
    controller: _emailController,
    style: TextStyle(
        color: Color.fromRGBO(10, 10, 10, 1), fontFamily: 'RadikalLight'),
    decoration: _buildInputDecoration("Email"),
  );
}



Widget _buildPassword() {
  return TextFormField(
    obscureText: true,
    controller: _passwordController,
    validator: (value) =>
        value!.length <= 6 ? "ERROR: Debe tener al menos 6 caracteres" : null,
    style: TextStyle(
        color: Color.fromRGBO(10, 10, 10, 1), fontFamily: 'RadikalLight'),
    decoration:
        _buildInputDecoration("Contraseña"),
  
  );

}

bool isEmail(String value) {
  String regex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(regex);

  return value.isNotEmpty && regExp.hasMatch(value);
}

Widget _buildConfirmPassword() {
  return Container(
      child: TextFormField(
        obscureText: true,
        validator: (value) => value!.isEmpty ||
                (value.isNotEmpty && value != _passwordController.text)
            ? "ERROR: Ambas claves deben conincidir"
            : null,
        style: TextStyle(
            color: Color.fromRGBO(10, 10, 10, 1), fontFamily: 'RadikalLight'),
        decoration: _buildInputDecoration("Confirme contraseña"),
      ));
}

  
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'ERROR: Este campo es requerido';
    if (value.length < 6) return 'ERROR: debe tener al menos 6 caracteres ';
    if (_passwordController.text != _repeatPasswordController.text) return 'ERROR: Ambas claves deben conincidir';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
          body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
          margin: const EdgeInsets.only(top: 30),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (_, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Vamos a configurar tu cuenta...', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(height: 20,),
                    Form(
                      key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state is AuthSigningIn) Center(child: CircularProgressIndicator()),                    
                              _buildEmail(),
                              _buildPassword(),
                              _buildConfirmPassword(),
                              SizedBox(height: 50),
                              Center(
                                child: ElevatedButton(
                                  child: const Text('Crear cuenta'),
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() == true) {
                                      context.read<AuthCubit>().createUserWithEmailAndPassword(
                                            _emailController.text,
                                            _passwordController.text,
                                          );
                                    }
                                  },
                                ),
                                
                              ),
                              Center(
                                child: ElevatedButton(
                                  child: const Text('Ya tengo cuenta'),
                                  onPressed: () {
                                     Navigator.pop(context);
                                     _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.login, (r) => false);

                                  }
                                ),
                                
                              ),
                              
                            ],
                          ),
                      ),
                  ],
                ),
                );
            },
          ),
        )
        );
  }
}

