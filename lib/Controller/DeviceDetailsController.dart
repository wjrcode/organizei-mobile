import 'dart:io';

import 'package:device_info/device_info.dart';
//import 'package:flutter_udid/flutter_udid.dart';
//import 'package:package_info/package_info.dart';
import 'package:organizei/Model/DeviceDetails/DeviceDetails.dart';

class DeviceDetailsController {
  var deviceDetails = DeviceDetails();

  Future<DeviceDetails> getDeviceDetails() async {
    String? devicePlatform;
    String? deviceVersion;
    String identifier;
    String? version;
    String? id;
    String? manufacturer;
    String? model;
    String? product;
    String? type;

    DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      var build = await _deviceInfoPlugin.androidInfo;

      devicePlatform = "Android";
      deviceVersion = build.version.release;
      //identifier = build.androidId;
      version = build.version.release;
      id = build.id;
      manufacturer = build.manufacturer;
      model = build.model;
      product = build.product;
      type = build.type;
    } else if (Platform.isIOS) {
      var data = await _deviceInfoPlugin.iosInfo;

      devicePlatform = "iOS";
      deviceVersion = data.systemVersion;
      version = data.systemVersion;
      id = "";
      manufacturer = "";
      model = data.name;
      product = "";
      type = "";
    }

    // var packageInfo = await PackageInfo.fromPlatform();
    //identifier = await FlutterUdid.udid;

    return new DeviceDetails(
      devicePlatform: devicePlatform,
      deviceVersion: deviceVersion,
      //identifier: identifier,
      version: version,
      id: id,
      manufacturer: manufacturer,
      model: model,
      product: product,
      type: type,
      // appName: packageInfo.appName,
      //appPackageName: packageInfo.appName,
      // appVersion: packageInfo.version,
      // appBuildNumber: packageInfo.buildNumber,
    );
  }
}
