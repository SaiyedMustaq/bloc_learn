import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerUtils imagePickerUtils;
  ImagePickerBloc({required this.imagePickerUtils}) : super(ImagePickerState()) {
    on<CameraImageEvent>(_pickImageFromCamera);
    on<GalleryImageEvent>(_pickImageFromGallery);
  }

  void _pickImageFromCamera(CameraImageEvent event, Emitter<ImagePickerState> emit) async {
    final XFile? file = await imagePickerUtils.cameraPick();
    emit(state.copyWith(file: file));
  }

  void _pickImageFromGallery(GalleryImageEvent event, Emitter<ImagePickerState> emit) async {
    final XFile? file = await imagePickerUtils.galleryPick();
    emit(state.copyWith(file: file));
  }
}
