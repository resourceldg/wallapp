import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;

  final String? image;

  MyUser(this.id, this.name, this.email, this.password, {this.image});

  @override
  List<Object?> get props => [id];

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'image': newImage ?? image,
    };
  }

  MyUser.fromFirebaseMap(Map<String, Object?> data)
      : id = data['id'] as String,
        name = data['name'] as String,
        email = data['email'] as String,
        password = data['password'] as String,
        image = data['image'] as String?;
}
 


/* 
class MyApiUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;



  MyApiUser(this.id, this.name, this.email, this.password);

  @override
  List<Object?> get props => [id];

  Map<String, Object?> toApiMap(String? NewImage) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'email': email,
      'password': password, 
      'token': token
    };
  }

 MyApiUser.fromApiMap(Map<String, Object?> data)
      : id = data['id'] as String,
        name = data['name'] as String,
        email = data['email'] as String,
        password = data['password'] as String
      
} */