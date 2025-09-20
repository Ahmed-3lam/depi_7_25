import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:depi_7_25/helpers/dio_helper.dart';
import 'package:depi_7_25/helpers/kapis.dart';
import 'package:depi_7_25/home/model/banner_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  var bannerModel = BannerModel();

  void getBanners() async {
    emit(BannerLoadingState());

    try {
      final response = await DioHelper.getData(KApis.banners);

      bannerModel = BannerModel.fromJson(response.data);

      if (bannerModel.statusCode == 200) {
        log("============= Start of Response =============");
        log(bannerModel.message.toString());
        emit(BannerSuccessState());
      } else {
        emit(BannerErrorState(response.data["message"]));
      }
    } catch (e) {
      emit(BannerErrorState(e.toString()));
    }
  }
}



///MVVM
