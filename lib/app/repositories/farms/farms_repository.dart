import 'package:crud_ponta/app/models/farm_model.dart';

abstract class FarmsRepository {
  Future<void> save(String name);
  Future<List<FarmModel>> findAll();
  Future<void> update(FarmModel farmModel);
}
