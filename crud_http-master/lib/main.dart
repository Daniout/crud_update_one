import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:crud_http/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'domain/controller/controllerStudent.dart';

void main() {
  Get.put(ControlUser());
  Get.put(ControlStudent());
  runApp(const App());
}
