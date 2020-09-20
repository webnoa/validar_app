import 'package:firebase_auth/firebase_auth.dart';

//Prueba.
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
//Prueba
  AuthenticationService(this._firebaseAuth);
//Prueba
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
//Prueba
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

//Prueba.
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

//Prueba.
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
