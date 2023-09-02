// ignore_for_file: implementation_imports

import 'package:device_frame/src/devices/ios/iphone_13/device.dart'
    as iphone_13;
import 'package:device_frame/src/devices/ios/iphone_13_mini/device.dart'
    as iphone_13_mini;
import 'package:device_frame/src/devices/ios/iphone_13_pro_max/device.dart'
    as iphone_13_pro_max;
import 'package:device_frame/src/devices/ios/iphone_se/device.dart'
    as iphone_se;
import 'package:flutter/material.dart';
import 'package:pawpath/storybook/notifier.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<DeviceInfo> devices = [
  iphone_13.info,
  iphone_13_pro_max.info,
  iphone_se.info,
  iphone_13_mini.info
];

class DevicePlugin extends Plugin {
  DevicePlugin()
      : super(
            icon: (_) => const Icon(Icons.phone_iphone),
            onPressed: (_) => changeDevice());
}
