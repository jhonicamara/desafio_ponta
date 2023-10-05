import 'package:crud_ponta/app/core/notifier/default_change_notifier.dart';
import 'package:crud_ponta/app/services/farms/farms_service.dart';
import 'package:flutter/material.dart';

class FarmCreateController extends DefaultChangeNotifier {
  FarmsService _farmsService;

  FarmCreateController({required FarmsService farmsService})
      : _farmsService = farmsService;

  Future<void> save(String name) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      await _farmsService.save(name);
      sucess();
    } catch (e, s) {
      print(e);
      print(s);
      setError('Error ao cadastrar fazenda');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
