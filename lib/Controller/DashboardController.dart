import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/DashboardRepository.dart';

class DashboardController extends Base {
  DashboardController(this.repository, this.context);

  final BuildContext context;
  final DashboardRepository repository;
  final formKey = GlobalKey<FormState>();

  Future<Map<String, dynamic>> getDashboard() async {
    return await repository.getDashboard();
  }
}
