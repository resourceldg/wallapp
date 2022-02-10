import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:realwallapp/MODELS/fastapi_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
/* import 'package:flutter_secure_storage/flutter_secure_storage.dart'; */


class ApiAuth {

  Future auth({
  required final String email,
  required final String password,
  
}) async {
    print(email);
    print(password);
    const url='http://192.168.1.17:8000/login';
    var response = await http.post(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != HttpStatus.ok) {
      print('Response: ${response.statusCode}');
      return;
    }

    final json = jsonDecode(response.body);
    final user = MyUser.fromJson(json);
  
    print('JWT Token: ${user.token}');
    var storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: '${user.token}');
    var value= await storage.read(key: 'token');
    print('JWT Token desde secure storge: ${value}');

  }


}