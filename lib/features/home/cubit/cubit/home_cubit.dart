import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:depi_7_25/core/network/dio_helper.dart';
import 'package:depi_7_25/core/network/kapis.dart';
import 'package:depi_7_25/features/home/model/banner_model.dart';
import 'package:depi_7_25/features/home/model/product_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  var bannerModel = BannerModel();
  var productModel = ProductModel();

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

  void getProduct() async {
    emit(ProductLoadingState());

    try{
      final response = await DioHelper.getData(KApis.products);
      productModel = ProductModel.fromJson(response.data);
      if(productModel.statusCode == 200){
        emit(ProductSuccessState());
      }else{
        emit(ProductErrorState(productModel.message??""));
      }
    }catch(e){
        emit(ProductErrorState(e.toString()));
    }
    }
  }


///MVVM
