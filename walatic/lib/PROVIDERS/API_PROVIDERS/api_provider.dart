
import 'package:walatic/MODELS/fastapi_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final storage = new FlutterSecureStorage();

class ApiProvider {
  Future<MyUser?> getMyUser() async {
    
    final token = await storage.read(key: "token");
      final user = MyUser();
      if (user.token != token && token!= null){
        print(user.token);
        return MyUser();
      };
  }
  Future<void> saveMyUser(MyUser user) async {
      final ref = MyUser();
    
    }

}