// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to `
  String get welcome {
    return Intl.message(
      'Welcome to ',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality.`
  String get description {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality.',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Start now`
  String get start {
    return Intl.message(
      'Start now',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get your_email {
    return Intl.message(
      'Your email',
      name: 'your_email',
      desc: '',
      args: [],
    );
  }

  /// `Your Password`
  String get your_Password {
    return Intl.message(
      'Your Password',
      name: 'your_Password',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get your_name {
    return Intl.message(
      'Your name',
      name: 'your_name',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `don't have an account?`
  String get do_have_account {
    return Intl.message(
      'don\'t have an account?',
      name: 'do_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get create_account {
    return Intl.message(
      'Create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `     OR     `
  String get or {
    return Intl.message(
      '     OR     ',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign WIth google`
  String get sign_with_google {
    return Intl.message(
      'Sign WIth google',
      name: 'sign_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Sign with facebook`
  String get sign_with_facebook {
    return Intl.message(
      'Sign with facebook',
      name: 'sign_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get new_account {
    return Intl.message(
      'New Account',
      name: 'new_account',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get create_new_account {
    return Intl.message(
      'Create new account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_pass {
    return Intl.message(
      'Forget Password',
      name: 'forget_pass',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just enter your email and we will send you the verification link.`
  String get don_worry {
    return Intl.message(
      'Don\'t worry, just enter your email and we will send you the verification link.',
      name: 'don_worry',
      desc: '',
      args: [],
    );
  }

  /// `Remember Password?`
  String get remember_password {
    return Intl.message(
      'Remember Password?',
      name: 'remember_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get valid_email {
    return Intl.message(
      'Enter a valid email',
      name: 'valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Your password is too short!`
  String get short_password {
    return Intl.message(
      'Your password is too short!',
      name: 'short_password',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get My_Profile {
    return Intl.message(
      'My Profile',
      name: 'My_Profile',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get Favorite {
    return Intl.message(
      'Favorite',
      name: 'Favorite',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Who we Are`
  String get who_we_are {
    return Intl.message(
      'Who we Are',
      name: 'who_we_are',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `At FruitHub, we are passionate about delivering the freshest and finest fruits straight to your doorstep. We believe in the power of natural nutrition and are committed to offering a wide variety of handpicked, farm-fresh fruits that promote a healthy and vibrant lifestyle. Our team works closely with trusted local farmers and suppliers to ensure every fruit meets the highest quality standards.Our mission is to make healthy eating convenient and accessible to everyone. Whether you’re looking to stock up on your favorites or try something new, FruitHub is here to simplify your fruit shopping experience. With a seamless app interface, quick delivery options, and a commitment to sustainability, we bring nature’s bounty to your table with just a few taps.Join us in our journey to create a healthier, happier community—one fruit at a time!`
  String get who_we_desc {
    return Intl.message(
      'At FruitHub, we are passionate about delivering the freshest and finest fruits straight to your doorstep. We believe in the power of natural nutrition and are committed to offering a wide variety of handpicked, farm-fresh fruits that promote a healthy and vibrant lifestyle. Our team works closely with trusted local farmers and suppliers to ensure every fruit meets the highest quality standards.Our mission is to make healthy eating convenient and accessible to everyone. Whether you’re looking to stock up on your favorites or try something new, FruitHub is here to simplify your fruit shopping experience. With a seamless app interface, quick delivery options, and a commitment to sustainability, we bring nature’s bounty to your table with just a few taps.Join us in our journey to create a healthier, happier community—one fruit at a time!',
      name: 'who_we_desc',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout?`
  String get want_to_logout {
    return Intl.message(
      'Do you want to logout?',
      name: 'want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personal_inform {
    return Intl.message(
      'Personal information',
      name: 'personal_inform',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_pass {
    return Intl.message(
      'Change Password',
      name: 'change_pass',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `New Email`
  String get new_email {
    return Intl.message(
      'New Email',
      name: 'new_email',
      desc: '',
      args: [],
    );
  }

  /// `New Name`
  String get new_name {
    return Intl.message(
      'New Name',
      name: 'new_name',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_pass {
    return Intl.message(
      'New Password',
      name: 'new_pass',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get Enter_name {
    return Intl.message(
      'Enter your name',
      name: 'Enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Check the email`
  String get check_email {
    return Intl.message(
      'Check the email',
      name: 'check_email',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `you have `
  String get you_have {
    return Intl.message(
      'you have ',
      name: 'you_have',
      desc: '',
      args: [],
    );
  }

  /// `products in your shopping cart.`
  String get products_in_cart {
    return Intl.message(
      'products in your shopping cart.',
      name: 'products_in_cart',
      desc: '',
      args: [],
    );
  }

  /// `No products in your cart.`
  String get No_products_in_cart {
    return Intl.message(
      'No products in your cart.',
      name: 'No_products_in_cart',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Pounds`
  String get pounds {
    return Intl.message(
      'Pounds',
      name: 'pounds',
      desc: '',
      args: [],
    );
  }

  /// `No favorite products found.`
  String get no_favorite {
    return Intl.message(
      'No favorite products found.',
      name: 'no_favorite',
      desc: '',
      args: [],
    );
  }

  /// `welcome!...`
  String get welcome_home {
    return Intl.message(
      'welcome!...',
      name: 'welcome_home',
      desc: '',
      args: [],
    );
  }

  /// `Search for...`
  String get search_for {
    return Intl.message(
      'Search for...',
      name: 'search_for',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get best_seller {
    return Intl.message(
      'Best Seller',
      name: 'best_seller',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
