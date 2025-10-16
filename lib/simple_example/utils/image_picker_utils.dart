import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker picker = ImagePicker();
  Future<XFile?> cameraPick() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future<XFile?> galleryPick() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
