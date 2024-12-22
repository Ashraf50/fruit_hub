import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/constant/shared_pref.dart';
import 'package:fruit_hub/core/helper/auth_helper.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/presentation/view_model/cubit/fetch_products_cubit.dart';
import 'package:fruit_hub/feature/profile/data/cubit/profile_image_cubit.dart';
import 'package:fruit_hub/feature/profile/presentation/view_model/bloc/language_bloc.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/google_facebook_bloc/google_facebook_bloc.dart';
import 'package:fruit_hub/feature/routing/app_router.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isLoggedIn = AuthHelper().loginStatus();
  final appRouter = AppRouter(isLoggedIn: isLoggedIn);

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => GoogleFacebookBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileImageCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => FetchProductsCubit()..loadFruitsData(),
        ),
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
      ],
      child:
          BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
        return MaterialApp.router(
          routerConfig: appRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          locale: state is AppChangeLanguage ? Locale(state.langCode) : null,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          localeListResolutionCallback: (deviceLocales, supportedLocales) {
            if (deviceLocales != null) {
              for (var deviceLocale in deviceLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (deviceLocale.languageCode ==
                      supportedLocale.languageCode) {
                    return deviceLocale;
                  }
                }
              }
            }
            return supportedLocales.first;
          },
        );
      }),
    );
  }
}
