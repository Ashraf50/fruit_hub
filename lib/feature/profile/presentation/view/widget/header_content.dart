import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/photo_viewer.dart';
import 'package:fruit_hub/feature/profile/data/cubit/profile_image_cubit.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/camera_button.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/shimmer_loading.dart';
import 'package:get/get.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageCubit, ProfileImageState>(
      builder: (context, state) {
        var cubit = ProfileImageCubit.get(context);
        return FutureBuilder<DocumentSnapshot>(
            future: cubit.users.doc(cubit.userDetails!.uid).get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("Document does not exist");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        cubit.imgPath == null
                            ? data["imgLink"] == null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    radius: 50,
                                    backgroundImage: const AssetImage(
                                      "assets/img/avatar.png",
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      Get.to(
                                        () =>
                                            PhotoViewer(image: data["imgLink"]),
                                      );
                                    },
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          NetworkImage(data["imgLink"]),
                                    ),
                                  )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  cubit.imgPath!,
                                ),
                              ),
                        Positioned(
                          bottom: -20,
                          left: 30,
                          child: CameraButton(
                            choosePhoto: () {
                              cubit.choosePhoto();
                              Navigator.pop(context);
                            },
                            takePhoto: () {
                              cubit.takePhoto();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["name"],
                          style: AppStyles.textStyle20,
                        ),
                        Text(
                          data["email"],
                          style: AppStyles.textStyle18,
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return const ProfileHeaderLoading(pictureRadius: 50,);
              }
            });
      },
    );
  }
}
