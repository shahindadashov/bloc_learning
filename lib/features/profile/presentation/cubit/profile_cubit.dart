import 'package:bloc/bloc.dart';
import 'package:bloc_learning/core/services/file_picking_service.dart';
import 'package:bloc_learning/core/services/image_picking_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ImagePickingService _imagePickingService = ImagePickingService();
  final FilePickingService _filePickingService = FilePickingService();

  final List<XFile> _selectedImages = [];
  PlatformFile? _selectedFile;

  void pickImage(ImageSource source) async {
    final selectedImage = await _imagePickingService.pickImage(source: source);
    if (selectedImage != null) {
      _selectedImages.add(selectedImage);
      emit(ProfileImagePicked(selectedImages: _selectedImages, selectedFile: _selectedFile));
    }
  }

  void pickFile() async {
    final selectedFile = await _filePickingService.pickFile();
    if (selectedFile != null) {
      _selectedFile = selectedFile.files.first;
      emit(ProfileImagePicked(selectedImages: _selectedImages, selectedFile: _selectedFile));
    }
  }

  void removeImage(int index) {
    _selectedImages.removeAt(index);
    emit(ProfileImagePicked(selectedImages: _selectedImages, selectedFile: _selectedFile));
  }
}
