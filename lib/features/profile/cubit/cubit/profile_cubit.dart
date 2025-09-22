import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:depi_7_25/core/network/dio_helper.dart';
import 'package:depi_7_25/core/network/kapis.dart';
import 'package:depi_7_25/features/profile/model/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  ProfileModel profileModel = ProfileModel();

  void getProfileData() async {
    emit(ProfileLoadingState());
    await Future.delayed(Duration(seconds: 4));
    try {
      final response = await DioHelper.getData(KApis.profile);
      log("=============== Response ================");
      log(response.data.toString());
      profileModel = ProfileModel.fromJson(response.data);

      if (profileModel.statusCode == 200) {
        emit(ProfileSuccessState());
      } else {
        emit(ProfileErrorState(profileModel.message ?? ""));
      }
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}
