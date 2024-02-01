import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'set_profile_event.dart';
part 'set_profile_state.dart';
part 'set_profile_bloc.freezed.dart';

class SetProfileBloc extends Bloc<SetProfileEvent, SetProfileState> {
  TextEditingController nameController = TextEditingController();
  SetProfileBloc() : super(SetProfileState.initial()) {
    on<PickImage>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: false,
            image: File(image.path),
          ),
        );
      }
    });
  }
}
