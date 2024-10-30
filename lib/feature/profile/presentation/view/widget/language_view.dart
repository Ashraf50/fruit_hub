import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/feature/profile/presentation/view_model/bloc/language_bloc.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).language),
      body: ListView(children: [
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<LanguageBloc>(context).add(ArabicLanguageEvent());
          },
          child: const Text("arabic"),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<LanguageBloc>(context).add(EnglishLanguageEvent());
          },
          child: const Text("English"),
        )
      ]),
    );
  }
}
