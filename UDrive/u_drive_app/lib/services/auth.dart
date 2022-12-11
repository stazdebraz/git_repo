import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _fireBauth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _fireBauth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _fireBauth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  setUserNameAndSurname(String name) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    user.updateDisplayName(name);
  }
}
