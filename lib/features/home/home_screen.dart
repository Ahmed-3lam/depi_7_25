import 'package:carousel_slider/carousel_slider.dart';
import 'package:depi_7_25/features/auth/view/login_screen.dart';
import 'package:depi_7_25/core/helpers/hive_helper.dart';
import 'package:depi_7_25/features/home/cubit/cubit/home_cubit.dart';
import 'package:depi_7_25/features/home/model/product_model.dart';
import 'package:depi_7_25/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const batteryChannel = MethodChannel('depi.flutter/battery');

  Future<void> _getBatteryLevel() async {
    try {
      final int result = await batteryChannel.invokeMethod('getBatteryLevel');
      print("Battery Level is $result %");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getBannersFromFirebase()
        ..getProduct(),
      child: Scaffold(
        appBar: _homeAppbar(width, context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: height * .03,
              left: width * .04,
              right: width * .04,
            ),
            child: Column(
              children: [
                _banners(),
                SizedBox(height: height * .03),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.popular_packages,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      AppLocalizations.of(context)!.view_all,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final products = context
                        .read<HomeCubit>()
                        .productModel
                        .data
                        ?.products;
                    if (state is ProductLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: products?.length ?? 0,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 3.3 / 4,
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) => Container(
                        height: 220,
                        width: 180,
                        margin: EdgeInsets.only(right: 14),
                        padding: EdgeInsets.only(
                          right: 15,
                          left: 15,
                          top: 15,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),

                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  products?[index].image ?? "",
                                  height: 84,
                                  width: 84,
                                ),
                              ],
                            ),
                            SizedBox(height: height * .01),
                            SizedBox(
                              width: 120,

                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                products?[index].name ?? "",
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                products?[index].description ?? "",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            SizedBox(height: height * .01),
                            Row(
                              children: [
                                Text(
                                  "\$ ${products?[index].price ?? 0}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: width * .01),
                                // Text(
                                //   "\$50",
                                //   style: TextStyle(
                                //     fontSize: 14,
                                //     color: Colors.grey,
                                //   ),
                                // ),
                                Spacer(),
                                FloatingActionButton(
                                  shape: const CircleBorder(),
                                  onPressed: () {},
                                  mini: true,
                                  backgroundColor: Colors.green,
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _banners() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final banners = context.read<HomeCubit>().bannerImages;
        if (state is BannerLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        return CarouselSlider(
          items: List.generate(
            (banners.length),
            (index) => Container(
              height: 200,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ), // Adjust the radius as needed
              ),
              child: Image.network(banners[index], fit: BoxFit.cover),
            ),
          ),
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  AppBar _homeAppbar(double width, BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          if (Get.locale.toString() == "ar") {
            Get.updateLocale(Locale("en"));
          } else {
            Get.updateLocale(Locale("ar"));
          }

          setState(() {});
        },
        child: Icon(Icons.menu),
      ),
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: width / 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(onTap: () {}, child: Icon(Icons.pin_drop)),
            SizedBox(width: width * .01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.current_location,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.green,
                      size: 30,
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.shebin_elkom,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10.0),
          child: InkWell(
            onTap: () async {
              await _getBatteryLevel();
              // HiveHelper.clearToken();
              // Get.offAll(LoginScreen());
            },
            child: Icon(Icons.logout),
          ),
        ),
        IconButton(
          onPressed: () async {
            await ImagePicker().pickImage(source: ImageSource.camera);
          },
          icon: Icon(Icons.camera),
        ),
      ],
    );
  }
}
