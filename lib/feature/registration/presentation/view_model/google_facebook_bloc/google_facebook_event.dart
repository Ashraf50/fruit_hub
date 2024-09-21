part of '../google_facebook_bloc/google_facebook_bloc.dart';

sealed class GoogleFacebookEvent {}

class GoogleSignEvent extends GoogleFacebookEvent {}

class FacebookSignEvent extends GoogleFacebookEvent {}
