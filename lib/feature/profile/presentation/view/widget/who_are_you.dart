import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import '../../../../../generated/l10n.dart';

class HowAreYouView extends StatelessWidget {
  const HowAreYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).who_we_are),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).who_we_desc,
              style: AppStyles.textStyle17,
            ),
          ],
        ),
      ),
    );
  }
}
