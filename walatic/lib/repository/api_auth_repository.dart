import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;

  AuthUser(this.id);

  @override
  List<Object> get props => [id];
}

abstract class AuthRepositoryBase {
/*   Stream<AuthUser?> get onAuthStateChanged; */

  Future<AuthUser?> signInWithEmailAndPassword(String email, String password);

  Future<AuthUser?> createUserWithEmailAndPassword(String email, String password);


  Future<void> signOut();
}
