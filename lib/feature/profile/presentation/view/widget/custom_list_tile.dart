import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/constant/text_style.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String image;
  final void Function() onTap;
  const CustomListTile(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    image,
                    height: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: AppStyles.textStyle18,
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 7,
        )
      ],
    );
  }
}
