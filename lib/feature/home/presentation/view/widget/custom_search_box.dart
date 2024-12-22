import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          '/search_view',
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Material(
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/img/search.svg",
                color: Colors.grey,
                height: 20,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                S.of(context).search_for,
                style: AppStyles.textStyle18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
