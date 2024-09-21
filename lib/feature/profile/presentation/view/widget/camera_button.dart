import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constant/app_colors.dart';

class CameraButton extends StatelessWidget {
  final void Function()? choosePhoto;
  final void Function()? takePhoto;
  const CameraButton({
    super.key,
    required this.choosePhoto,
    required this.takePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: const Color(0xffEBF9F1),
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 180,
                child: Column(
                  children: [
                    TextButton(
                      title: "Choose photo",
                      onTap: choosePhoto,
                    ),
                    TextButton(
                      title: "Take photo",
                      onTap: takePhoto,
                    ),
                    TextButton(
                      title: "Cancel",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        backgroundColor: const Color(0xffF9F9F9),
        child: SvgPicture.asset(
          "assets/img/Camera.svg",
          height: 20,
        ),
      ),
    );
  }
}

class TextButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const TextButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.buttonColor,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Divider(),
        )
      ],
    );
  }
}
