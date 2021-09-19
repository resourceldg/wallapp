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
    
    validator: (value) => !isEmail(_emailController.text) ? "Sorry, we do not recognize this email address" : null,
    style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    
  );
}


 String? emailValidator(String? value) {
    return ((value) => !isEmail(value) ? "Sorry, we do not recognize this email address" : null).toString();
  } 


bool isEmail(String value) {
  String regex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(regex);

  return value.isNotEmpty && regExp.hasMatch(value);
}

Widget _buildConfirmPassword() {
  return Container(
      margin: const EdgeInsets.only(left: 40),
      child: TextFormField(
        obscureText: true,
        validator: (value) => value!.isEmpty ||
                (value.isNotEmpty && value != _passwordController.text)
            ? "Must match the previous entry"
            : null,
        style: TextStyle(
            color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
        
      ));
}

Widget _buildPassword() {
  return TextFormField(
    obscureText: true,
    controller: _passwordController,
    validator: (value) =>
        value!.length <= 6 ? "Password must be 6 or more characters in length" : null,
    style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    
  );
}


  
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'This is a required field';
    if (value.length < 6) return 'Password should be at least 6 letters';
    if (_passwordController.text != _repeatPasswordController.text) return 'Password do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Create account')),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (state is AuthSigningIn) Center(child: CircularProgressIndicator()),                    
                        _buildEmail(),
                        _buildPassword(),
                        _buildConfirmPassword(),
                        Center(
                          child: ElevatedButton(
                            child: const Text('Create'),
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
              );
          },
        )
        );
  }
}
