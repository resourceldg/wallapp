import 'dart:io';

import 'package:walatic/model/user.dart';
import 'package:walatic/provider/firebase_provider.dart';
import 'package:walatic/repository/my_user_repository.dart';

class MyUserRepository extends MyUserRepositoryBase {
  final provider = FirebaseProvider();

  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user, File? image) => provider.saveMyUser(user, image);
}
