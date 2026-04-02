import 'package:image_picker/image_picker.dart';

class ImagePickingService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    if (selectedImage != null) {
      return selectedImage;
    }
    return null;
  }
}
