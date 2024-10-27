import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Authentication/presentation/view_models/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthCubit(this._firebaseAuth) : super(AuthInitial());

  //* Login method with Firebase error handling
  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthAuthenticated());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const AuthError('No user found with this email.'));
      } else if (e.code == 'wrong-password') {
        emit(const AuthError('Incorrect password. Please try again.'));
      } else {
        emit(
            const AuthError('An unexpected error occurred. Please try again.'));
      }
    } catch (e) {
      emit(const AuthError('Something went wrong. Please try again later.'));
    }
  }

  //* Register method with Firebase error handling
  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(AuthAuthenticated());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(const AuthError('This email is already registered.'));
      } else if (e.code == 'weak-password') {
        emit(const AuthError('The password is too weak.'));
      } else {
        emit(
            const AuthError('An unexpected error occurred. Please try again.'));
      }
    } catch (e) {
      emit(const AuthError('Something went wrong. Please try again later.'));
    }
  }
  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(AuthAuthenticated());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const AuthError('No user found with this email.'));
      } else if (e.code == 'wrong-password') {
        emit(const AuthError('Incorrect password. Please try again.'));
      } else {
        emit(
            const AuthError('An unexpected error occurred. Please try again.'));  
      }
    } catch (e) {
      emit(const AuthError('Something went wrong. Please try again later.'));
    }
  }

  //* Sign out
  Future<void> signOut() async {
    emit(AuthLoading());
    await _firebaseAuth.signOut();
    emit(AuthUnauthenticated());
  }

  void checkAuthStatus() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  bool isUserAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }
}
