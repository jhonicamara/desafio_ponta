import 'package:crud_ponta/app/core/notifier/default_change_notifier.dart';
import 'package:crud_ponta/app/models/farm_model.dart';
import 'package:crud_ponta/app/services/farms/farms_service.dart';
import 'package:flutter/material.dart';

class HomeController extends DefaultChangeNotifier {
  final FarmsService _farmsService;
  List<FarmModel> allFarms = [];

  HomeController({required FarmsService farmsService})
      : _farmsService = farmsService;

  Future<void> loadAllFarms() async {
    showLoading();
    notifyListeners();

    final allFarmsFromDB = await _farmsService.findAll();
    allFarms = allFarmsFromDB;

    hideLoading();
    notifyListeners();
  }

  void refreshPage() async {
    await loadAllFarms();
    notifyListeners();
  }
}
