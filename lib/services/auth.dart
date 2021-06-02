import 'package:chat_app/model/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserDetails _userFromFirebaseUser(User fireBaseUser) {
    return fireBaseUser != null ? UserDetails(userId: fireBaseUser.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User fireBaseUser = result.user;
      return _userFromFirebaseUser(fireBaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future signUpWithUserNameAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User fireBaseUser = result.user;
      return _userFromFirebaseUser(fireBaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
