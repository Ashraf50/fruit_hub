import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileHeaderLoading extends StatelessWidget {
  final double pictureRadius;
  const ProfileHeaderLoading({
    super.key,
    required this.pictureRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: const Color(0xff949D9E),
          highlightColor: const Color(0xff949D9E),
          child: CircleAvatar(
            radius: pictureRadius,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: const Color(0xff949D9E),
              highlightColor: const Color(0xff949D9E),
              child: Container(
                height: 20,
                width: 100,
                decoration: const BoxDecoration(
                  color: Color(0xff949D9E),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Shimmer.fromColors(
              baseColor: const Color(0xff949D9E),
              highlightColor: const Color(0xff949D9E),
              child: Container(
                height: 20,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
