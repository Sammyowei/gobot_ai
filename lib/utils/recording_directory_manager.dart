import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingDirectoryManager {
  // check for storage permission.
  Future<void> checkAndCreateDirectory() async {
    if (Platform.isAndroid || Platform.isIOS) {
      var status = await Permission.storage.status;

      if (!status.isGranted) {
        status = await Permission.storage.request();
      }

      if (status.isGranted) {
        var externalStorage = await getExternalStorageDirectory();

        if (externalStorage == null ||
            !(await FileSystemEntity.isDirectory(externalStorage.path))) {
          log('External storage not available or not writable');
          return;
        }

        var recordingDirectory =
            Directory('${externalStorage.path}/gobot/data/.recording');

        if (!(await recordingDirectory.exists())) {
          await recordingDirectory.create(recursive: true);
          log('Recording directory created: ${recordingDirectory.path}');
        } else {
          log('Recording directory already exists: ${recordingDirectory.path}');
        }
      } else if (status.isDenied) {
        log("Storage permission has been denied");
      }
    } else {
      log("platform is not supported");
    }
  }

  Future<void> createDirectory() async {
    var appSupportDir = await getApplicationSupportDirectory();
    var recordingDirectory =
        Directory('${appSupportDir.path}/gobot/data/.recording');

    if (!(await recordingDirectory.exists())) {
      await recordingDirectory.create(recursive: true);
      print('Recording directory created: ${recordingDirectory.path}');
    } else {
      print('Recording directory already exists: ${recordingDirectory.path}');
    }
  }

  void checkRecordingPermission() async {
    var status = await Permission.microphone.status;

    if (!status.isGranted) {
      status = await Permission.microphone.request();
    } else if (status.isDenied) {
      status = await Permission.microphone.request();
    } else {
      log("Permission has been granted to use the microphone");
    }
  }
}
