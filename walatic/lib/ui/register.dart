import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walatic/bloc/auth_cubit.dart';

class Register extends StatefulWidget {
  static Widget create(BuildContext context) => Register();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();


  Widget _buildEmail() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Ingresa tu correo'),
    validator: (value) => !isEmail(_emailController.text) ? "El formato de correo es incorrecto" : null,
    style: TextStyle(
        color: Color.fromRGBO(10, 10, 10, 1), fontFamily: 'RadikalLight'),
    
  );
}


 String? emailValidator(String? value) {
    return ((value) => !isEmail(value) ? "El formato de correo  esincorrecto" : null).toString();
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
        decoration: InputDecoration(labelText: 'Repite tu contraseña'),
        validator: (value) => value!.isEmpty ||
                (value.isNotEmpty && value != _passwordController.text)
            ? "Las contraseñas deben coincidir"
            : null,
        style: TextStyle(
            color: Color.fromRGBO(10, 10, 10, 1), fontFamily: 'RadikalLight'),
        
      ));
}

Widget _buildPassword() {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(labelText: 'Elige una contraseña'),
    controller: _passwordController,
    validator: (value) =>
        value!.length <= 6 ? "Debe contener al menos 6 caracteres" : null,
    style: TextStyle(
        color: Color.fromRGBO(10, 10, 10, 1), fontFamily: 'RadikalLight'),
    
  );
}


  
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Este campo es requerido';
    if (value.length < 6) return 'Debe contener al menos 6 caracteres';
    if (_passwordController.text != _repeatPasswordController.text) return 'Las contraseñas no coinciden';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Crear Cuenta'),backgroundColor: Colors.deepPurple,),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state is AuthSigningIn) Center(child: CircularProgressIndicator()),                    
                          _buildEmail(),
                          _buildPassword(),
                          _buildConfirmPassword(),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              child: const Text('Crear', style: TextStyle(fontSize: 22)),
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
                        ],
                      ),
                    ),
                ),
              );
          },
        )
        );
  }
}
