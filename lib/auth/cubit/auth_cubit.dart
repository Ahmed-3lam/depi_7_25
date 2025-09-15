import 'package:bloc/bloc.dart';
import 'package:depi_7_25/auth/models/login_model.dart';
import 'package:depi_7_25/helpers/dio_helper.dart';
import 'package:depi_7_25/helpers/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(LoginModel loginModel) async {
    emit(AuthLoadingState());

    try {
      final response = await DioHelper.postData(
        path: "login",
        body: {"email": loginModel.email, "password": loginModel.password},
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", response.data["message"]);
        emit(AuthSuccessState());
      } else {
         Get.snackbar("Error", response.data["message"]);
        emit(AuthErrorState());
      }


    } catch (e) {
      emit(AuthErrorState());
    }
  }
}
