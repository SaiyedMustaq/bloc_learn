import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<PermissionStatus> cameraPermission() async {
    final PermissionStatus cameraStatus = await Permission.camera.request();
    return cameraStatus;
  }

  static Future<PermissionStatus> galleryPermission() async {
    final PermissionStatus cameraStatus = await Permission.storage.request();
    return cameraStatus;
  }
}
