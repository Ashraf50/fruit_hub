import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/constant/shared_pref.dart';
part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) {
      if (event is InitialLanguageEvent) {
        if (sharedPreferences!.getString("lang") != null) {
          if (sharedPreferences!.getString("lang") == "ar") {
            emit(AppChangeLanguage(langCode: "ar"));
          } else {
            emit(AppChangeLanguage(langCode: "en"));
          }
        }
      } else if (event is ArabicLanguageEvent) {
        sharedPreferences!.setString("lang", "ar");
        emit(AppChangeLanguage(langCode: "ar"));
      } else if (event is EnglishLanguageEvent) {
        sharedPreferences!.setString("lang", "en");
        emit(AppChangeLanguage(langCode: "en"));
      }
    });
  }
}
