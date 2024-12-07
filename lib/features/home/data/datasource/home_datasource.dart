import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/error/failures.dart';
import '../models/home_data_model.dart';

abstract interface class HomeDatasource {
  Future<HomeDataModel> getHomeScreenData();
}

class HomeDatasourceImpl implements HomeDatasource {
  @override
  Future<HomeDataModel> getHomeScreenData() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      final jsonString = await rootBundle.loadString('assets/json/data.json');

      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

      final homeData = HomeDataModel.fromJson(jsonMap);

      return homeData;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
