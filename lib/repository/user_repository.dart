import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth auth;
  String email;
  String password;
  UserRepository(this.auth);

//アカウント作成
  Future<void> signUp() async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

//サインイン
  Future<void> signin() async {
    return auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //サインアウト
  Future<void> signOut() async {
    auth.signOut();
  }

  isSignedIn() {
    final currentUser = auth.currentUser;
    return currentUser != null;
  }

  getUser() async {
    return auth.currentUser.email;
  }
}
