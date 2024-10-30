import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/feature/profile/data/cubit/profile_image_cubit.dart';
import 'package:fruit_hub/feature/profile/presentation/view/profile_view.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/shimmer_loading.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      data["imgLink"] == null
                          ? InkWell(
                              borderRadius: BorderRadius.circular(24),
                              onTap: () => Get.to(() => const ProfileView()),
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 25,
                                  backgroundImage: const AssetImage(
                                      "assets/img/avatar.png")),
                            )
                          : InkWell(
                              borderRadius: BorderRadius.circular(24),
                              onTap: () => Get.to(() => const ProfileView()),
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      NetworkImage(data["imgLink"])),
                            ),
                      const SizedBox(width: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).welcome_home,
                            style: AppStyles.textStyle18,
                          ),
                          Text(
                            data["name"],
                            style: AppStyles.textStyle17,
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(24),
                    child: SvgPicture.asset(
                      "assets/img/app_bar_notification.svg",
                      height: 40,
                    ),
                  )
                ],
              );
            } else {
              return const ProfileHeaderLoading(pictureRadius: 25);
            }
          },
        );
      },
    );
  }
}
