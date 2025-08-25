import 'package:bloc/bloc.dart';
import 'package:depi_7_25/auth/models/login_model.dart';
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
      await Future.delayed(Duration(seconds: 5));
      if (loginModel.email == "3lam.ahmed@gmail.com" &&
          loginModel.password == "123456") {
        await HiveHelper.setLoginData(loginModel);
        HiveHelper.getLoginData();
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState());
      }
    } catch (e) {
      emit(AuthErrorState());
    }
  }
}
