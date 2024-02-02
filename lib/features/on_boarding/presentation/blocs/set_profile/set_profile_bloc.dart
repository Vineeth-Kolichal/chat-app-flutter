import 'dart:io';

import 'package:chat_app/features/on_boarding/domain/usecase/set_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'set_profile_event.dart';
part 'set_profile_state.dart';
part 'set_profile_bloc.freezed.dart';

@injectable
class SetProfileBloc extends Bloc<SetProfileEvent, SetProfileState> {
  SetProfileUseCase useCase;
  TextEditingController nameController = TextEditingController();
  SetProfileBloc(this.useCase) : super(SetProfileState.initial()) {
    on<PickImage>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final croppedImage = await ImageCropper().cropImage(
            sourcePath: image.path,
            aspectRatioPresets: [CropAspectRatioPreset.square],
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 50,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: "Adjust Image",
                toolbarColor: Colors.blue,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: true,
              ),
              IOSUiSettings(title: "Adjust Image"),
            ]);
        if (croppedImage != null) {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: false,
              image: File(croppedImage.path),
            ),
          );
        }
      }
    });

    on<Submit>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
      final resp = await useCase(
          ProfileParam(name: nameController.text.trim(), image: state.image));
      final newState = resp.fold((fail) {
        return state.copyWith(
            isLoading: false, error: fail.error, isSuccess: false);
      }, (success) {
        return state.copyWith(
            isLoading: false, error: null, isSuccess: true, image: null);
      });
      emit(newState);
    });
  }
}
