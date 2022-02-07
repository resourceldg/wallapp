import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:walatic/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, base64, ascii;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walatic/repository/auth_repository.dart';
import 'package:http/http.dart' as http;






class AuthApi extends AuthRepositoryBase {
  final _firebaseAuth = FirebaseAuth.instance;

  getInstance( String email, String pass) async{
    String url = "https://wardixlab.com/login";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email":email, "pass":pass};
    var jsonresponse;
    var res = await http.post(Uri.parse(url), body: body);
    if (res.statusCode==200){
      print("Response status: ${res.statusCode}" );
      print("Response status: ${res.body}" );
      sharedPreferences.setString("token",jsonresponse['token']);
      }
    }

  AuthUser? _userFromApi(User? user) => user == null ? null : AuthUser(user.uid);

  @override
  Stream<AuthUser?> get onAuthStateChanged => _firebaseAuth.authStateChanges().asyncMap(_userFromApi);

  @override
  Future<AuthUser?> createUserWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromApi(authResult.user);
  }

  @override
  Future<AuthUser?> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromApi(authResult.user);
  }

  @override
  Future<AuthUser?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final authResult = await FirebaseAuth.instance.signInWithCredential(credential);
    return _userFromApi(authResult.user);
  }

 @override
  Future<AuthUser?> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    final facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

    final authResult = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    return _userFromApi(authResult.user);
  } 

  @override
  Future<AuthUser?> signInAnonymously() async {
    final user = await _firebaseAuth.signInAnonymously();
    return _userFromApi(user.user);
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
/* const SERVER_IP = 'https://wardixlab.com';
final storage = FlutterSecureStorage();


// IMPLEMENTACION API CON FAST API


class AuthApi extends StatefulWidget {
  const AuthApi({ Key? key }) : super(key: key);

  @override
  _AuthApiState createState() => _AuthApiState();
}

class _AuthApiState extends State<AuthApi> {
  bool _isLoading = false;

  getInstance( String email, String pass) async{
    String url = "https://wardixlab.com/login";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email":email, "pass":pass};
    var jsonresponse;
    var res = await http.post(Uri.parse(url), body: body);
    if (res.statusCode==200){
      print("Response status: ${res.statusCode}" );
      print("Response status: ${res.body}" );
      if (jsonresponse != null){
        setState(() {
          _isLoading=false;

        });
        sharedPreferences.setString("token",jsonresponse['token']);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
} */