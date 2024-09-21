part of 'profile_image_cubit.dart';

sealed class ProfileImageState {}

final class ProfileImageInitial extends ProfileImageState {}

final class ImageLoadingSuccess extends ProfileImageState {}

final class ImageLoadingFailure extends ProfileImageState {}
