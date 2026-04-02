part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileImagePicking extends ProfileState {}

final class ProfileImagePicked extends ProfileState {
  final List<XFile> selectedImages;
  final PlatformFile? selectedFile;

  ProfileImagePicked({required this.selectedImages, this.selectedFile});
}
