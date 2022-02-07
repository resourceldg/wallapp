import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
 
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  late final String? token;
  MyUser({
    this.id,
    this.name,
    this.password,
    this.email,
    this.token,
  });
  @override
  List<Object?> get props => [id];
  factory MyUser.fromJson(Map<String?, dynamic> data){ return MyUser (
        id: data['id'],
        name: data['name'],
        email: data['email'],
        password: data['password'],
        token: data['token'],
      ); 
  }
  Map<String, Object?> toApiMap() {
    return <String, Object?>{
      'id': id,
      'name': name,
      'email': email,
      'password': password, 
      'token': token
    };
  }

  MyUser.fromApiMap(Map<String, Object?> data)
      : id = data['id'] as int,
        name = data['name'] as String,
        email = data['email'] as String,
        password = data['password'] as String,
        token = data['token'] as String;

}
