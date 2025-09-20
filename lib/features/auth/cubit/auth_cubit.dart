import 'package:bloc/bloc.dart';
import 'package:depi_7_25/features/auth/models/api_login_model.dart';
import 'package:depi_7_25/features/auth/models/login_model.dart';
import 'package:depi_7_25/core/network/dio_helper.dart';
import 'package:depi_7_25/core/helpers/hive_helper.dart';
import 'package:depi_7_25/core/network/kapis.dart';
import 'package:depi_7_25/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  ApiLoginModel apiLoginModel = ApiLoginModel();

  void login(LoginModel loginModel) async {
    emit(AuthLoadingState());

    try {
      final response = await DioHelper.postData(
        path: KApis.login,
        body: {"email": loginModel.email, "password": loginModel.password},
      );

      apiLoginModel = ApiLoginModel.fromJson(response.data);

      if (apiLoginModel.statusCode == 200) {
        HiveHelper.setToken(apiLoginModel.data!.token!);
        Get.offAll(HomeScreen());
        emit(AuthSuccessState());
      } else {
        Get.snackbar("Error", response.data["message"]);
        emit(AuthErrorState());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e.toString());
      emit(AuthErrorState());
    }
  }
}
