import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walatic/bloc/auth_cubit.dart';
import 'package:walatic/navigation/routes.dart';
import 'package:walatic/repository/IMPLEMENTATION/FASTAPI/api_auth.dart';


class LoginPage extends StatelessWidget {
  
  static Widget create(BuildContext context) => LoginPage();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    final isSigningIn = authCubit.state is AuthSigningIn;
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    
    String? emptyValidator(String? value) {
    return (value == null || value.isEmpty) ? 'El campo es requerido' : null;
    }


    return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (_, state) {
            return SingleChildScrollView(
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
                            if (state is AuthSigningIn) Center(child: CircularProgressIndicator()),
                            if (state is AuthError)
                              Text(
                                state.message,
                                style: TextStyle(color: Colors.red, fontSize: 24),
                              ),
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
                                  ApiAuth().auth(email: _emailController.text, password: _passwordController.text);
                                  if (_formKey.currentState?.validate() == true) {
                                    /* context.read<AuthCubit>().signInWithEmailAndPassword(
                                          _emailController.text,
                                          _passwordController.text,
                                        ); */
                                       
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isSigningIn) CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                    
                      ),
                    )
                  ],
                ),
              ),
            );
      
              },
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
