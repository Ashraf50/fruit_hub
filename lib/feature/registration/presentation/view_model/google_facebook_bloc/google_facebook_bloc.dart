import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'google_facebook_event.dart';
part 'google_facebook_state.dart';

class GoogleFacebookBloc
    extends Bloc<GoogleFacebookEvent, GoogleFacebookState> {
  GoogleFacebookBloc() : super(GoogleFacebookInitial()) {
    on<GoogleFacebookEvent>((event, emit) async {
      if (event is GoogleSignEvent) {
        emit(GooglSignLoading());
        try {
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          if (googleUser == null) {
            emit(GooglSignFailure(messageError: "Google login was canceled"));
            return;
          }
          final GoogleSignInAuthentication googleAuth =
              await googleUser.authentication;
          if (googleAuth.accessToken == null && googleAuth.idToken == null) {
            emit(GooglSignFailure(
                messageError:
                    "Failed to authenticate with Google. Access token and ID token are missing."));
            return;
          }
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          final user =
              await FirebaseAuth.instance.signInWithCredential(credential);
          CollectionReference users =
              FirebaseFirestore.instance.collection("Users");
          await users.doc(user.user!.uid).set({
            'name': googleUser.displayName,
            'email': googleUser.email,
            'imgLink': googleUser.photoUrl,
          });
          emit(GooglSignSuccess());
        } on FirebaseAuthException catch (e) {
          emit(GooglSignFailure(
              messageError: "Firebase Auth Error: ${e.message}"));
        } on Exception {
          emit(GooglSignFailure(messageError: "Something went wrong"));
        }
      } else if (event is FacebookSignEvent) {
        emit(FacebookSignLoading());
        try {
          final LoginResult loginResult = await FacebookAuth.instance.login(
            permissions: ['email', 'public_profile'],
          );
          if (loginResult.status != LoginStatus.success ||
              loginResult.accessToken == null) {
            emit(
                FacebookSignFailure(errMessage: "Facebook login was canceled"));
            return;
          }
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(
                  loginResult.accessToken!.tokenString);
          final UserCredential userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);
          if (userCredential.user == null) {
            emit(FacebookSignFailure(
                errMessage: "Failed to sign in with Facebook credentials"));
            return;
          }
          final userData = await FacebookAuth.instance.getUserData();
          final user = userCredential.user;
          CollectionReference users =
              FirebaseFirestore.instance.collection("Users");
          await users.doc(user!.uid).set({
            'name': user.displayName ?? userData['name'] ?? "Anonymous",
            'email': user.email ?? userData['email'] ?? "No email",
            'phone': user.phoneNumber ?? "No Phone",
            'imgLink':
                user.photoURL ?? userData['picture']['data']['url'] ?? "",
          });
          emit(FacebookSignSuccess());
        } on FirebaseAuthException catch (e) {
          emit(FacebookSignFailure(
              errMessage: "Firebase Auth Error: ${e.message}"));
        } on Exception catch (e) {
          emit(FacebookSignFailure(
              errMessage: "Something went wrong: ${e.toString()}"));
        }
      }
    });
  }
}
