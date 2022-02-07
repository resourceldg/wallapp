import 'dart:io';
import 'package:walatic/MODELS/fastapi_user.dart';
import 'package:walatic/PROVIDERS/API_PROVIDERS/api_provider.dart';
import 'package:walatic/repository/amy_user_repository.dart';

class MyUserRepository extends MyUserRepositoryBase {
  final provider = ApiProvider();

  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

   @override
  Future<void> saveMyUser(MyUser user) => provider.saveMyUser(user);  
}
 