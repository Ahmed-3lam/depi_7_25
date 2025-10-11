import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_7_25/features/auth/models/api_login_model.dart';
import 'package:depi_7_25/features/auth/models/login_model.dart';
import 'package:depi_7_25/core/network/dio_helper.dart';
import 'package:depi_7_25/core/helpers/hive_helper.dart';
import 'package:depi_7_25/core/network/kapis.dart';
import 'package:depi_7_25/features/home/home_screen.dart';
import 'package:depi_7_25/features/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:depi_7_25/features/auth/models/api_login_model.dart' as model;

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
        DioHelper.addTokenInterceptor();
        addUserToFireStore(apiLoginModel.data!.user!);
        // Get.offAll(MainScreen());
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

  void loginWithFirebase() async {
    try {
      emit(AuthLoadingGoogleSignInState());
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      FirebaseAuth.instance.signInWithCredential(credential);

      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState());
      print(e.toString());
    }
  }

  void addUserToFireStore(model.User user) async {
    final usersCollection =  FirebaseFirestore.instance.collection(
      "users",
    );
    
    await usersCollection.add(user.toJson());
  }
}
