import 'package:crud_ponta/app/models/farm_model.dart';
import 'package:crud_ponta/app/repositories/farms/farms_repository.dart';
import 'package:crud_ponta/app/services/farms/farms_service.dart';

class FarmsServiceImpl implements FarmsService {
  final FarmsRepository _farmsRepository;

  FarmsServiceImpl({
    required FarmsRepository farmsRepository,
  }) : _farmsRepository = farmsRepository;

  @override
  Future<void> save(String name) => _farmsRepository.save(name);

  @override
  Future<List<FarmModel>> findAll() => _farmsRepository.findAll();

  @override
  Future<void> update(FarmModel farmModel) =>
      _farmsRepository.update(farmModel);
}
