

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:walatic/UI/WIDGET_CONTROLERS/LOGIN_CONTROLER/snackbar.dart';
import 'package:walatic/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walatic/bloc/auth_cubit.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;


  /* TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController = TextEditingController(); */
//custon signUp
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  late final String _error;

  String? emailValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'This is a required field';
    if (value.length < 6) return 'Password should be at least 6 letters';
    if (_passwordController.text != _repeatPasswordController.text) return 'Password do not match';
    return null;
  }


  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
          body: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, state) {
          return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 23.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Card(
                        elevation: 2.0,
                        color: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: 300.0,
                          height: 360.0,
                          child: Column(
                            children: <Widget>[
                              if (state is AuthSigningIn) Center(child: CircularProgressIndicator()),
                               if (state is AuthError)
                                Text(
                                  state.message,
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ), 
                                      
                             
                             /*  Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                                child: TextFormField(
                                  focusNode: focusNodeName,
                                  controller: signupNameController,
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
                                  autocorrect: false,
                                  style: const TextStyle(
                                      fontFamily: 'WorkSans',
                                      fontSize: 16.0,
                                      color: CustomTheme.yellowBlack),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      FontAwesomeIcons.user,
                                      color: CustomTheme.yellowBlack,
                                    ),
                                    hintText: 'Name',
                                    hintStyle: TextStyle(
                                        fontFamily: 'WorkSans', fontSize: 16.0,
                                        color: Colors.grey),
                                  ),
                                  onSubmitted: (_) {
                                    focusNodeEmail.requestFocus();
                                  },
                                ),
                              ), */
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                                child: TextFormField(
                                  focusNode: focusNodeEmail,
                                  controller: _emailController,
                                  validator: emailValidator,
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  style: const TextStyle(
                                      fontFamily: 'WorkSans',
                                      fontSize: 16.0,
                                      color: CustomTheme.yellowBlack),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      FontAwesomeIcons.envelope,
                                      color: CustomTheme.yellowBlack,
                                    ),
                                    hintText: 'Email Address',
                                    hintStyle: TextStyle(
                                        fontFamily: 'WorkSans', fontSize: 16.0,
                                        color: Colors.grey),
                                  ),
                                  /* onSubmitted: (_) {
                                    focusNodePassword.requestFocus();
                                  }, */
                                ),
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                                child: TextFormField(
                                  focusNode: focusNodePassword,
                                  controller: _passwordController,
                                  validator: passwordValidator,
                                  obscureText: _obscureTextPassword,
                                  autocorrect: false,
                                  style: const TextStyle(
                                      fontFamily: 'WorkSans',
                                      fontSize: 16.0,
                                      color: CustomTheme.yellowBlack),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: const Icon(
                                      FontAwesomeIcons.lock,
                                      color: CustomTheme.yellowBlack,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        fontFamily: 'WorkSansd', fontSize: 16.0,
                                        color: Colors.grey),
                                    suffixIcon: GestureDetector(
                                      onTap: _toggleSignup,
                                      child: Icon(
                                        _obscureTextPassword
                                            ? FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash,
                                        size: 15.0,
                                        color: CustomTheme.yellowBlack,
                                      ),
                                    ),
                                  ),
                                  /* onSubmitted: (_) {
                                    focusNodeConfirmPassword.requestFocus();
                                  }, */
                                ),
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                                child: TextFormField(
                                  focusNode: focusNodeConfirmPassword,
                                  controller: _repeatPasswordController,
                                  validator: passwordValidator,
                                  obscureText: _obscureTextConfirmPassword,
                                  autocorrect: false,
                                  style: const TextStyle(
                                      fontFamily: 'WorkSans',
                                      fontSize: 16.0,
                                      color: CustomTheme.yellowBlack),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: const Icon(
                                      FontAwesomeIcons.lock,
                                      color: CustomTheme.yellowBlack,
                                    ),
                                    hintText: 'Confirmation',
                                    hintStyle: const TextStyle(
                                        fontFamily: 'WorkSans', fontSize: 16.0,
                                        color: Colors.grey),
                                    suffixIcon: GestureDetector(
                                      onTap: _toggleSignupConfirm,
                                      child: Icon(
                                        _obscureTextConfirmPassword
                                            ? FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash,
                                        size: 15.0,
                                        color: CustomTheme.yellowBlack,
                                      ),
                                    ),
                                  ),
                                 /*  onSubmitted: (_) {
                                    _toggleSignUpButton();
                                  }, */
                                  textInputAction: TextInputAction.go,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 340.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: CustomTheme.loginGradientStart,
                              offset: Offset(1.0, 6.0),
                              blurRadius: 20.0,
                            ),
                            BoxShadow(
                              color: CustomTheme.loginGradientEnd,
                              offset: Offset(1.0, 6.0),
                              blurRadius: 20.0,
                            ),
                          ],
                          gradient: LinearGradient(
                              colors: <Color>[
                                CustomTheme.loginGradientEnd,
                                CustomTheme.loginGradientStart
                    

                              ],
                              begin: FractionalOffset(0.2, 0.2),
                              end: FractionalOffset(1.0, 1.0),
                              stops: <double>[0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: MaterialButton(
                          highlightColor: Colors.transparent,
                          splashColor: CustomTheme.loginGradientEnd,
                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: CustomTheme.yellowBlack,
                                  fontSize: 25.0,
                                  fontFamily: 'WorkSansBold'),
                            ),
                          ),
                          
                          onPressed: () => {
                          
                            if (state !=AuthError){
                                  _toggleSignUpButton()
                                }
                              
                            },
                        ),
                      )
                    ],
                  ),
                ],
              )
              ),
            );
          },)
        );
      
  }

  void _toggleSignUpButton() async{
    
    await {
          if (_formKey.currentState?.validate() == true ){
              context.read<AuthCubit>().createUserWithEmailAndPassword(
                _emailController.text,
                _passwordController.text,
              ),
              CustomSnackBar(context, const Text('Successfully SignUp!! ')),
          
          }//if
    
    };
  }

dynamic _errorToggleSignUpButton(state) async{
  final String error = state.message;
  await CustomSnackBar(context, Text(error));
}
  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }
}
