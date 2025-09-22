import 'package:depi_7_25/features/profile/cubit/cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileErrorState) {
            Get.snackbar("Error", state.msg);
          }
        },
        builder: (context, state) {
          final profileData = context.read<ProfileCubit>().profileModel.data;
          if (state is ProfileLoadingState) {
            return Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFF1A1A3F),
                rightDotColor: const Color(0xFFEA3799),
                size: 200,
              ),
            );
          }
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(profileData?.image ?? ""),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${profileData?.name}"),
                        SizedBox(height: 20),
                        Text("Email: ${profileData?.email}"),
                        SizedBox(height: 20),
                        Text("Phone: ${profileData?.phone}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
