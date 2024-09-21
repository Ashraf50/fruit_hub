part of '../google_facebook_bloc/google_facebook_bloc.dart';

sealed class GoogleFacebookState {}

final class GoogleFacebookInitial extends GoogleFacebookState {}

class GooglSignLoading extends GoogleFacebookState {}

class GooglSignSuccess extends GoogleFacebookState {}

class GooglSignFailure extends GoogleFacebookState {
  final String messageError;
  GooglSignFailure({
    required this.messageError,
  });
}

class FacebookSignLoading extends GoogleFacebookState {}

class FacebookSignSuccess extends GoogleFacebookState {}

class FacebookSignFailure extends GoogleFacebookState {
  final String errMessage;
  FacebookSignFailure({required this.errMessage});
}
