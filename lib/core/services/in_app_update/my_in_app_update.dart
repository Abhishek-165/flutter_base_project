import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

import '../../../common/features/update_available/android_force_update.dart';
import '../../../common/features/update_available/android_update_availlable.dart';
import '../../../common/features/update_available/ios_force_update.dart';
import '../../../common/features/update_available/ios_update_available.dart';

abstract class MyInAppUpdate {
  Future<bool> ifForceAndroidUpdateRequired();
  Future<bool> isAndroidUpdateAvailable();
  Future<bool> ifForceIOSUpdateRequired();
  Future<bool> isIOSUpdateAvailable();
  void checkUpdate(BuildContext context);
}

class MyInAppUpdateImp extends MyInAppUpdate {
  static final MyInAppUpdateImp _singleton = MyInAppUpdateImp._internal();
  MyInAppUpdateImp._internal();

  static MyInAppUpdateImp getInstance() => _singleton;

  @override
  Future<bool> ifForceAndroidUpdateRequired() async {
    final info = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(info.version);
    Version minimumVersion = Version.parse(
        FirebaseRemoteConfig.instance.getString('minimum_app_version_android'));
    return currentVersion < minimumVersion;
  }

  @override
  Future<bool> isAndroidUpdateAvailable() async {
    final info = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(info.version);
    Version latestVersion = Version.parse(
        FirebaseRemoteConfig.instance.getString('latest_app_version_android'));
    return latestVersion > currentVersion;
  }

  @override
  Future<bool> ifForceIOSUpdateRequired() async {
    final info = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(info.version);
    Version minimumVersion = Version.parse(
        FirebaseRemoteConfig.instance.getString('minimum_app_version_ios'));
    return currentVersion < minimumVersion;
  }

  @override
  Future<bool> isIOSUpdateAvailable() async {
    final info = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(info.version);
    Version latestVersion = Version.parse(
        FirebaseRemoteConfig.instance.getString('latest_app_version_ios'));
    return latestVersion > currentVersion;
  }

  _iosForceUpdate(context) {
    showModalBottomSheet(
        isScrollControlled: false,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (_) {
          return const IOSForceUpdate();
        });
  }

  _iosUpdateAvailble(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (_) {
          return const IOSUpdateAvailable();
        });
  }

  _androidForceUpdateSheet(context) {
    showModalBottomSheet(
        isScrollControlled: false,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (_) {
          return const AndroidForceUpdateAvailble();
        });
  }

  _androidUpdateAvailble(context) {
    showModalBottomSheet(
        isScrollControlled: false,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (_) {
          return const AndroidUpdateAvailble();
        });
  }

  @override
  void checkUpdate(BuildContext context) async {
    if (Platform.isIOS && await ifForceIOSUpdateRequired()) {
      _iosForceUpdate(context);
    } else if (Platform.isIOS && await isIOSUpdateAvailable()) {
      _iosUpdateAvailble(context);
    } else if (Platform.isAndroid && await ifForceAndroidUpdateRequired()) {
      _androidForceUpdateSheet(context);
    } else if (Platform.isAndroid && await isAndroidUpdateAvailable()) {
      _androidUpdateAvailble(context);
    }
  }
}
