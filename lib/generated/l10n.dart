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

  /// `Enjoy the Cloud memory application for\n free without ads`
  String get onboarding_1_title {
    return Intl.message(
      'Enjoy the Cloud memory application for\n free without ads',
      name: 'onboarding_1_title',
      desc: '',
      args: [],
    );
  }

  /// `The fastest application for saving data and files\nAnd cloud storage`
  String get onboarding_2_title {
    return Intl.message(
      'The fastest application for saving data and files\nAnd cloud storage',
      name: 'onboarding_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy our packages\n Featured at the lowest prices`
  String get onboarding_3_title {
    return Intl.message(
      'Enjoy our packages\n Featured at the lowest prices',
      name: 'onboarding_3_title',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get next {
    return Intl.message(
      'next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
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

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Trash`
  String get trash {
    return Intl.message(
      'Trash',
      name: 'trash',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get lang {
    return Intl.message(
      'English',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAnAccount {
    return Intl.message(
      'Create an account',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your cloud storage account`
  String get signInToYourCloudStorageAccount {
    return Intl.message(
      'Sign in to your cloud storage account',
      name: 'signInToYourCloudStorageAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get userName {
    return Intl.message(
      'UserName',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your account name`
  String get enterYourAccountName {
    return Intl.message(
      'Enter your account name',
      name: 'enterYourAccountName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter a phone number`
  String get enterPhone {
    return Intl.message(
      'Enter a phone number',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account on the platform?`
  String get alreadyHavAccount {
    return Intl.message(
      'Do you have an account on the platform?',
      name: 'alreadyHavAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `registration`
  String get rigist {
    return Intl.message(
      'registration',
      name: 'rigist',
      desc: '',
      args: [],
    );
  }

  /// `Follow via Google`
  String get loginByGoogle {
    return Intl.message(
      'Follow via Google',
      name: 'loginByGoogle',
      desc: '',
      args: [],
    );
  }

  /// `You must enter your email or phone number to continue.`
  String get mustEnterEmail {
    return Intl.message(
      'You must enter your email or phone number to continue.',
      name: 'mustEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Detect`
  String get detect {
    return Intl.message(
      'Detect',
      name: 'detect',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the number that was sent to your phone to continue`
  String get enterPhonOtp {
    return Intl.message(
      'Enter the number that was sent to your phone to continue',
      name: 'enterPhonOtp',
      desc: '',
      args: [],
    );
  }

  /// `Enter the number that was sent to your email number to continue`
  String get enterEmailOtp {
    return Intl.message(
      'Enter the number that was sent to your email number to continue',
      name: 'enterEmailOtp',
      desc: '',
      args: [],
    );
  }

  /// `Go Back`
  String get goBack {
    return Intl.message(
      'Go Back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get contenue {
    return Intl.message(
      'Continue',
      name: 'contenue',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get confirmPassword {
    return Intl.message(
      'Password Confirmation',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get newPassword {
    return Intl.message(
      'new password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Resend confirmation code`
  String get resendOtp {
    return Intl.message(
      'Resend confirmation code',
      name: 'resendOtp',
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
