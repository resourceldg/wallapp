
import 'package:walatic/repository/IMPLEMENTATION/FASTAPI/api_auth.dart';
import 'package:walatic/repository/api_auth_repository.dart';
import 'package:walatic/MODELS/fastapi_user.dart';



class AuthRepository extends AuthRepositoryBase {
  final _apiAuth = ApiAuth();


  AuthUser? _userFromApi(MyUser? user) => user == null ? null : AuthUser('${user.id}');

 
  @override
  Future<AuthUser?> createUserWithEmailAndPassword(String email, String password) async {
    final authResult = await _apiAuth.auth(email: email, password: password);
    return _userFromApi(authResult.user);
  }

  @override
  Future<AuthUser?> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _apiAuth.auth(email: email, password: password);
    return _userFromApi(authResult.user);
  }

  @override
  Future<void> signOut() async {
    /* await _apiAuth.signOut(); */
  }
}
