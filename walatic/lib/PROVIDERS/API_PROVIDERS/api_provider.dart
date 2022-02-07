
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
    
    return null;
  }
 /* Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<MyUser?> candidateAuth({Map? map}) async {
    String url = "http://127.0.0.1:8000/login";
    await http
        .post(Uri.parse(url),
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json'
            },
            body: jsonEncode(map))
        .then((response) {
      if (response.statusCode == 201) {
        var token = MyUser.fromApiMap(json.decode(response.body)).token;
        MyUser().token?=setToken(token);
        return MyUser.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed auth');
      }
    });
  }

}

User get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Not authenticated exception');
    return user;
  }


  Future<MyUser?> getMyUser() async {
    final snapshot = await firestore.doc('user/${currentUser.uid}').get();
    if (snapshot.exists) return MyUser.fromFirebaseMap(snapshot.data()!);
    return null;
  }

  Future<void> saveMyUser(MyUser user, File? image) async {
    final ref = firestore.doc('user/${currentUser.uid}');
    if (image != null) {
      final imagePath = '${currentUser.uid}/profile/${path.basename(image.path)}';
      final storageRef = storage.ref(imagePath);
      await storageRef.putFile(image);
      final url = await storageRef.getDownloadURL();
      await ref.set(user.toFirebaseMap(newImage: url), SetOptions(merge: true));
    } else {
      await ref.set(user.toFirebaseMap(), SetOptions(merge: true));
    } */
  }