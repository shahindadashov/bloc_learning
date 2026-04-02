import 'package:file_picker/file_picker.dart';

class FilePickingService {
  final FilePicker _filePicker = FilePicker.platform;
  Future<FilePickerResult?> pickFile() async {
    FilePickerResult? result = await _filePicker.pickFiles();
    if (result != null) {
      return result;
    }
    return null;
  }
}
