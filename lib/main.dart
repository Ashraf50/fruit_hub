import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widget/snack_bar.dart';
import 'package:fruit_hub/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:fruit_hub/feature/home/presentation/view_model/cubit/fetch_products_cubit.dart';
import 'package:fruit_hub/feature/profile/data/cubit/profile_image_cubit.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:fruit_hub/feature/registration/presentation/view_model/google_facebook_bloc/google_facebook_bloc.dart';
import 'package:fruit_hub/feature/splash_view/view/splash_view1.dart';
import 'package:fruit_hub/feature/splash_view/view/splash_view3.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 181, 180, 180),
              ));
            } else if (snapshot.hasError) {
              return showSnackBar(context, "Something went wrong");
            } else if (snapshot.hasData) {
              return const SplashView3();
            } else {
              return const SplashView1();
            }
          },
        ),
      ),
    );
  }
}
