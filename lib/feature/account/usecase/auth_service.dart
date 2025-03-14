import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth) {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print("auth_service: No firebase user");
      } else {
        user.showInfo();
      }
    });
  }

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<UserCredential> signInAnonymously() {
    return _auth.signInAnonymously();
  }

  Future<UserCredential> register(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signInWithPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(ref.watch(firebaseAuthProvider));
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authServiceProvider).authStateChanges();
}

extension UserExt on User {
  void showInfo() {
    print("user: uid=$uid, email=$email, emailVerified=$emailVerified");
  }
}
