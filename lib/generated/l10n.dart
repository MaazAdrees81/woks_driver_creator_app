// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Order id`
  String get order_id {
    return Intl.message(
      'Order id',
      name: 'order_id',
      desc: '',
      args: [],
    );
  }

  /// `Delivery boy`
  String get delivery_boy {
    return Intl.message(
      'Delivery boy',
      name: 'delivery_boy',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Recent orders`
  String get recent_orders {
    return Intl.message(
      'Recent orders',
      name: 'recent_orders',
      desc: '',
      args: [],
    );
  }

  /// `User bio`
  String get user_bio {
    return Intl.message(
      'User bio',
      name: 'user_bio',
      desc: '',
      args: [],
    );
  }

  /// `Orders history`
  String get orders_history {
    return Intl.message(
      'Orders history',
      name: 'orders_history',
      desc: '',
      args: [],
    );
  }

  /// `Address not provided contact client`
  String get address_not_provided_contact_client {
    return Intl.message(
      'Address not provided contact client',
      name: 'address_not_provided_contact_client',
      desc: '',
      args: [],
    );
  }

  /// `Cus name`
  String get cus_name {
    return Intl.message(
      'Cus name',
      name: 'cus_name',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Ordered products`
  String get ordered_products {
    return Intl.message(
      'Ordered products',
      name: 'ordered_products',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer {
    return Intl.message(
      'Customer',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `Vat price`
  String get vat_price {
    return Intl.message(
      'Vat price',
      name: 'vat_price',
      desc: '',
      args: [],
    );
  }

  /// `Sub total`
  String get sub_total {
    return Intl.message(
      'Sub total',
      name: 'sub_total',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Delivery address`
  String get delivery_address {
    return Intl.message(
      'Delivery address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `alt number`
  String get alt_number {
    return Intl.message(
      'alt number',
      name: 'alt_number',
      desc: '',
      args: [],
    );
  }

  /// `Pay status`
  String get pay_status {
    return Intl.message(
      'Pay status',
      name: 'pay_status',
      desc: '',
      args: [],
    );
  }

  /// `Delivery confirmation`
  String get delivery_confirmation {
    return Intl.message(
      'Delivery confirmation',
      name: 'delivery_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Would you pleas confirm if you have delivered all meals to client`
  String get would_you_pleas_confirm_if_you_have_delivered_all_meals_to_client {
    return Intl.message(
      'Would you pleas confirm if you have delivered all meals to client',
      name: 'would_you_pleas_confirm_if_you_have_delivered_all_meals_to_client',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message(
      'Dismiss',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Delivery addresses`
  String get delivery_addresses {
    return Intl.message(
      'Delivery addresses',
      name: 'delivery_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash on delivery',
      name: 'cash_on_delivery',
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

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get offline {
    return Intl.message(
      'Offline',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `Enter your text`
  String get enter_your_text {
    return Intl.message(
      'Enter your text',
      name: 'enter_your_text',
      desc: '',
      args: [],
    );
  }

  /// `Application preferences`
  String get application_preferences {
    return Intl.message(
      'Application preferences',
      name: 'application_preferences',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
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

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `App settings`
  String get app_settings {
    return Intl.message(
      'App settings',
      name: 'app_settings',
      desc: '',
      args: [],
    );
  }

  /// `Help & support`
  String get help_and_support {
    return Intl.message(
      'Help & support',
      name: 'help_and_support',
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

  /// `App language`
  String get app_language {
    return Intl.message(
      'App language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `Select your prefered languages`
  String get select_your_prefered_languages {
    return Intl.message(
      'Select your prefered languages',
      name: 'select_your_prefered_languages',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
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

  /// `if you dont have account`
  String get if_you_dont_have_account {
    return Intl.message(
      'if you dont have account',
      name: 'if_you_dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get already_have_an_account {
    return Intl.message(
      'Already have an account',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Swipe left the notification to delete or read / unread it`
  String get swipe_left_the_notification_to_delete_or_read_unread_it {
    return Intl.message(
      'Swipe left the notification to delete or read / unread it',
      name: 'swipe_left_the_notification_to_delete_or_read_unread_it',
      desc: '',
      args: [],
    );
  }

  /// `Item is packed successfully`
  String get item_is_packed_successfully {
    return Intl.message(
      'Item is packed successfully',
      name: 'item_is_packed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Contact info`
  String get contact_info {
    return Intl.message(
      'Contact info',
      name: 'contact_info',
      desc: '',
      args: [],
    );
  }

  /// `Pickup address`
  String get pickup_address {
    return Intl.message(
      'Pickup address',
      name: 'pickup_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter otp`
  String get enter_otp {
    return Intl.message(
      'Enter otp',
      name: 'enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `Successfully`
  String get successfully {
    return Intl.message(
      'Successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `This account is not exist`
  String get this_account_is_not_exist {
    return Intl.message(
      'This account is not exist',
      name: 'this_account_is_not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Debe ser un correo electrónico válido`
  String get should_be_valid_email {
    return Intl.message(
      'Debe ser un correo electrónico válido',
      name: 'should_be_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Debe tener más de 3 caracteress`
  String get should_be_more_than_3_characters {
    return Intl.message(
      'Debe tener más de 3 caracteress',
      name: 'should_be_more_than_3_characters',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message(
      'Light Mode',
      name: 'light_mode',
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

  /// `Order details`
  String get order_details {
    return Intl.message(
      'Order details',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Pickup`
  String get pickup {
    return Intl.message(
      'Pickup',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `Update successfully`
  String get update_successfully {
    return Intl.message(
      'Update successfully',
      name: 'update_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Verify your internet connection`
  String get verify_your_internet_connection {
    return Intl.message(
      'Verify your internet connection',
      name: 'verify_your_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Wrong email or password`
  String get wrong_email_or_password {
    return Intl.message(
      'Wrong email or password',
      name: 'wrong_email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `Your reset link has been sent to your email`
  String get your_reset_link_has_been_sent_to_your_email {
    return Intl.message(
      'Your reset link has been sent to your email',
      name: 'your_reset_link_has_been_sent_to_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Error verify email settings`
  String get error_verify_email_settings {
    return Intl.message(
      'Error verify email settings',
      name: 'error_verify_email_settings',
      desc: '',
      args: [],
    );
  }

  /// `OTP is not matched`
  String get otp_is_not_matched {
    return Intl.message(
      'OTP is not matched',
      name: 'otp_is_not_matched',
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

  /// `NO DATA FOUND`
  String get no_data_found {
    return Intl.message(
      'NO DATA FOUND',
      name: 'no_data_found',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'my'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}