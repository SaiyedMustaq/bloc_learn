import 'dart:io';

import 'package:bloc_app/simple_example/utils/image_picker_utils.dart';
import 'package:bloc_app/simple_example/utils/permission_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../bloc/image_picker/image_picker_bloc.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImagePickerPageState();
  }
}

class ImagePickerPageState extends State<ImagePickerPage> {
  @override
  Widget build(BuildContext context) {
    final imagePickerBloc = context.read<ImagePickerBloc>();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ImagePickerBloc, ImagePickerState>(
            buildWhen: (previous, current) => previous.file != current.file,
            builder: (context, state) {
              return state.file == null
                  ? Text("No Image")
                  : Stack(
                      children: [
                        ClipRRect(child: Image.file(File(state.file!.path), height: 200, width: 200)),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove_circle_outline_sharp, color: Colors.red, size: 25),
                          ),
                        ),
                      ],
                    );
            },
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  PermissionStatus cameraStatus = await PermissionUtils.cameraPermission();
                  if (cameraStatus.isGranted) {
                    imagePickerBloc.add(CameraImageEvent());
                  }
                },
                child: Text("Camera"),
              ),
              ElevatedButton(
                onPressed: () async {
                  PermissionStatus storageStatus = await PermissionUtils.galleryPermission();
                  if (storageStatus.isGranted) {
                    imagePickerBloc.add(GalleryImageEvent());
                  }
                },
                child: Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
