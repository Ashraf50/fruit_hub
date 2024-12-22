import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widget/botom_bar.dart';
import 'package:fruit_hub/feature/cart/presentation/view/cart_view.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';
import 'package:fruit_hub/feature/home/presentation/view/widget/details_view_body.dart';
import 'package:fruit_hub/feature/profile/presentation/view/profile_view.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/language_view.dart';
import 'package:fruit_hub/feature/profile/presentation/view/widget/perssonal_information_view.dart';
import 'package:fruit_hub/feature/registration/presentation/view/forget_password_view.dart';
import 'package:fruit_hub/feature/registration/presentation/view/sign_in_view.dart';
import 'package:fruit_hub/feature/registration/presentation/view/sign_up_view.dart';
import 'package:fruit_hub/feature/search/presentation/view/search_view.dart';
import 'package:go_router/go_router.dart';
import '../../core/widget/photo_viewer.dart';
import '../favorite/presentation/view/favorite_view.dart';
import '../home/presentation/view_model/cubit/fetch_products_cubit.dart';
import '../profile/presentation/view/widget/who_are_you.dart';

class AppRouter {
  final bool isLoggedIn;
  AppRouter({required this.isLoggedIn});
  late final GoRouter router = GoRouter(
    initialLocation: isLoggedIn ? "/bottomBar" : '/signInView',
    routes: [
      GoRoute(
        path: '/bottomBar',
        builder: (context, state) => const BottomBar(),
      ),
      GoRoute(
        path: '/signInView',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: '/signUnView',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/forgetPassword',
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: '/profileView',
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: '/details_view',
        builder: (context, state) {
          final fruits = state.extra as FruitModel;
          return DetailsViewBody(
            fruits: fruits,
          );
        },
      ),
      GoRoute(
        path: '/search_view',
        builder: (context, state) {
          return BlocBuilder<FetchProductsCubit, FetchProductsState>(
            builder: (context, state) {
              if (state is FetchProductsSuccess) {
                return SearchView(
                  product: state.fruits,
                );
              }
              return const SearchView(
                product: [],
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/personalInfo',
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return const PersonalInformationView(
                  horizontal: 20,
                );
              } else {
                return PersonalInformationView(
                  horizontal: MediaQuery.sizeOf(context).width * .2,
                );
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/cart_view',
        builder: (context, state) {
          return const CartView();
        },
      ),
      GoRoute(
        path: '/fav_view',
        builder: (context, state) {
          return const FavoriteView();
        },
      ),
      GoRoute(
        path: '/language_view',
        builder: (context, state) {
          return const LanguageView();
        },
      ),
      GoRoute(
        path: '/howAreYouView',
        builder: (context, state) {
          return const HowAreYouView();
        },
      ),
      GoRoute(
        path: '/photoView',
        builder: (context, state) {
          final image = state.extra as String;
          return PhotoViewer(
            image: image,
          );
        },
      ),
    ],
  );
}
