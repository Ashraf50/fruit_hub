import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          final user =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          CollectionReference users =
              FirebaseFirestore.instance.collection("Users");
          users
              .doc(user.user!.uid)
              .set(
                {
                  'name': event.name,
                  'email': event.email,
                  'password': event.password,
                },
              )
              .then(
                (value) => print("User Added"),
              )
              .catchError((error) => print("Failed to add user: $error"));
          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFailure(messageError: 'weak-password'));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailure(messageError: 'email-already-in-use'));
          } else {
            emit(RegisterFailure(messageError: e.code));
          }
        } on Exception {
          emit(RegisterFailure(messageError: "something went wrong"));
        }
      } else if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(message: "user-not-found"));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(message: 'wrong-password'));
          } else {
            emit(LoginFailure(message: e.code));
          }
        } on Exception {
          emit(LoginFailure(message: "something went wrong"));
        }
      } else if (event is ResetEvent) {
        emit(ResetLoading());
        try {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: event.email);
          emit(ResetSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(ResetFailure(messageError: "user-not-found"));
          } else if (e.code == 'wrong-password') {
            emit(ResetFailure(messageError: 'wrong-password'));
          } else {
            emit(ResetFailure(messageError: e.code));
          }
        } on Exception {
          emit(ResetFailure(messageError: "something went wrong"));
        }
      } else if (event is UpdateEvent) {
        emit(UpdateLoading());
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser == null) throw Exception('No authenticated user.');
        try {
          await currentUser.verifyBeforeUpdateEmail(event.email);
          await currentUser.reload();
          if (currentUser.emailVerified) {
            await currentUser.updatePassword(event.password).then((_) {
              print("Password updated successfully");
            }).catchError((error) {
              print("Failed to update password: $error");
            });
            CollectionReference users =
                FirebaseFirestore.instance.collection("Users");
            await users
                .doc(currentUser.uid)
                .update(
                  {
                    'name': event.username,
                    'email': event.email,
                    'password': event.password,
                  },
                )
                .then(
                  (value) => print("updated data"),
                )
                .catchError((error) => print("Failed to update data: $error"));
          } else {
            emit(UpdateFailure(messageError: "Email not verified yet."));
          }
          emit(UpdateSuccess());
        } on Exception {
          emit(UpdateFailure(messageError: "something went wrong"));
        }
      }
    });
  }
}
