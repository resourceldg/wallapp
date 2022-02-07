import 'dart:io';

import 'package:walatic/MODELS/fastapi_user.dart';

abstract class MyUserRepositoryBase {
  Future<MyUser?> getMyUser();

 
} 
