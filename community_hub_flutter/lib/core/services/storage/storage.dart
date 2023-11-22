

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'storage_keys.dart';

late SharedPreferences prefs;

class Storage {
  Storage();


  //save and fetch themeMode
  void saveThemeMode(ThemeMode theme) => prefs.setInt(
      kThemeModeKey,
      theme == ThemeMode.light
          ? 0
          : theme == ThemeMode.dark
              ? 1
              : 2);

  ThemeMode fetchThemeMode() => prefs.containsKey(kThemeModeKey)
      ? (prefs.getInt(kThemeModeKey)! == 0
          ? ThemeMode.light
          : prefs.getInt(kThemeModeKey) == 1
              ? ThemeMode.dark
              : ThemeMode.system)
      : ThemeMode.system;

  //save and fetch hide balance option
  void saveHideBalance(bool value) => prefs.setBool(kHideBalanceKey, value);

  bool fetchHideBalance() => prefs.containsKey(kHideBalanceKey)
      ? prefs.getBool(kHideBalanceKey)!
      : false;

  //save and fetch biometric authentication
  void saveBiometricAuth(bool value) => prefs.setBool(kBiometricKey, value);

  bool fetchBiometricAuth() =>
      prefs.containsKey(kBiometricKey) ? prefs.getBool(kBiometricKey)! : false;

  //save and fetch selected avatar
  void saveSelectedAvatar(int value) => prefs.setInt(kSelectedAvatarKey, value);

  int fetchSelectedAvatar() => prefs.containsKey(kSelectedAvatarKey)
      ? prefs.getInt(kSelectedAvatarKey)!
      : 0;

  void saveOnBoardingInfo() => prefs.setBool(kOnBoardingKey, true);

  bool fetchOnBoardingInfo() => prefs.containsKey(kOnBoardingKey);

  void removeUser() => prefs.remove(kUserKey);

  void removeAll() => prefs.clear();
}
