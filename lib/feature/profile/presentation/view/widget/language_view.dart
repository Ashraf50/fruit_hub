import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widget/custom_app_bar.dart';
import '../../../../../core/widget/custom_scaffold.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/bloc/language_bloc.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = BlocProvider.of<LanguageBloc>(context).state
            is AppChangeLanguage
        ? (BlocProvider.of<LanguageBloc>(context).state as AppChangeLanguage)
            .langCode
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).language),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              S.of(context).arabic,
              style: const TextStyle(fontSize: 18),
            ),
            leading: Icon(
              _selectedLanguage == 'ar'
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: _selectedLanguage == 'ar' ? Colors.green : null,
            ),
            onTap: () {
              setState(() {
                _selectedLanguage = 'ar';
              });
              BlocProvider.of<LanguageBloc>(context).add(ArabicLanguageEvent());
            },
          ),
          ListTile(
            title: Text(S.of(context).english,
                style: const TextStyle(fontSize: 18)),
            leading: Icon(
              _selectedLanguage == 'en'
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: _selectedLanguage == 'en' ? Colors.green : null,
            ),
            onTap: () {
              setState(() {
                _selectedLanguage = 'en';
              });
              BlocProvider.of<LanguageBloc>(context)
                  .add(EnglishLanguageEvent());
            },
          ),
        ],
      ),
    );
  }
}
