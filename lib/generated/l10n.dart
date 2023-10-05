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

  /// `Products`
  String get Products {
    return Intl.message(
      'Products',
      name: 'Products',
      desc: '',
      args: [],
    );
  }

  /// `Clients`
  String get Clients {
    return Intl.message(
      'Clients',
      name: 'Clients',
      desc: '',
      args: [],
    );
  }

  /// `Maintenace`
  String get Maintenace {
    return Intl.message(
      'Maintenace',
      name: 'Maintenace',
      desc: '',
      args: [],
    );
  }

  /// `Userpage`
  String get Userpage {
    return Intl.message(
      'Userpage',
      name: 'Userpage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get Department {
    return Intl.message(
      'Department',
      name: 'Department',
      desc: '',
      args: [],
    );
  }

  /// `Product name`
  String get Productname {
    return Intl.message(
      'Product name',
      name: 'Productname',
      desc: '',
      args: [],
    );
  }

  /// `Product price`
  String get Productprice {
    return Intl.message(
      'Product price',
      name: 'Productprice',
      desc: '',
      args: [],
    );
  }

  /// `Product description`
  String get Productdescription {
    return Intl.message(
      'Product description',
      name: 'Productdescription',
      desc: '',
      args: [],
    );
  }

  /// `Product originalprice`
  String get Productoriginalprice {
    return Intl.message(
      'Product originalprice',
      name: 'Productoriginalprice',
      desc: '',
      args: [],
    );
  }

  /// `Product amount`
  String get Productamount {
    return Intl.message(
      'Product amount',
      name: 'Productamount',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get Imagename {
    return Intl.message(
      'name',
      name: 'Imagename',
      desc: '',
      args: [],
    );
  }

  /// `Client name`
  String get Clientname {
    return Intl.message(
      'Client name',
      name: 'Clientname',
      desc: '',
      args: [],
    );
  }

  /// `problem name`
  String get problemname {
    return Intl.message(
      'problem name',
      name: 'problemname',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Problemprice ' key

  /// `end date`
  String get enddate {
    return Intl.message(
      'end date',
      name: 'enddate',
      desc: '',
      args: [],
    );
  }

  /// `start date`
  String get startdate {
    return Intl.message(
      'start date',
      name: 'startdate',
      desc: '',
      args: [],
    );
  }

  /// `paidup`
  String get paidup {
    return Intl.message(
      'paidup',
      name: 'paidup',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message(
      'price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `update`
  String get update {
    return Intl.message(
      'update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `ِAdd`
  String get add {
    return Intl.message(
      'ِAdd',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// ` item add`
  String get itemadd {
    return Intl.message(
      ' item add',
      name: 'itemadd',
      desc: '',
      args: [],
    );
  }

  /// ` item delete`
  String get itemdelete {
    return Intl.message(
      ' item delete',
      name: 'itemdelete',
      desc: '',
      args: [],
    );
  }

  /// ` item update`
  String get itemupdate {
    return Intl.message(
      ' item update',
      name: 'itemupdate',
      desc: '',
      args: [],
    );
  }

  /// ` Login`
  String get login {
    return Intl.message(
      ' Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// ` Singin `
  String get registar {
    return Intl.message(
      ' Singin ',
      name: 'registar',
      desc: '',
      args: [],
    );
  }

  /// `Enter  email`
  String get email {
    return Intl.message(
      'Enter  email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter  password`
  String get password {
    return Intl.message(
      'Enter  password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enteremail {
    return Intl.message(
      'Enter your email',
      name: 'enteremail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterpassword {
    return Intl.message(
      'Enter your password',
      name: 'enterpassword',
      desc: '',
      args: [],
    );
  }

  /// `don\t have account ?`
  String get noaccount {
    return Intl.message(
      'don\t have account ?',
      name: 'noaccount',
      desc: '',
      args: [],
    );
  }

  /// `I have account ?`
  String get haveaccount {
    return Intl.message(
      'I have account ?',
      name: 'haveaccount',
      desc: '',
      args: [],
    );
  }

  /// `Add Proudct`
  String get addproudct {
    return Intl.message(
      'Add Proudct',
      name: 'addproudct',
      desc: '',
      args: [],
    );
  }

  /// `Edit Proudct`
  String get EditProudct {
    return Intl.message(
      'Edit Proudct',
      name: 'EditProudct',
      desc: '',
      args: [],
    );
  }

  /// `Add Problem`
  String get addproblem {
    return Intl.message(
      'Add Problem',
      name: 'addproblem',
      desc: '',
      args: [],
    );
  }

  /// `Edit Problem`
  String get Editproblem {
    return Intl.message(
      'Edit Problem',
      name: 'Editproblem',
      desc: '',
      args: [],
    );
  }

  /// ` Admin `
  String get Admin {
    return Intl.message(
      ' Admin ',
      name: 'Admin',
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
