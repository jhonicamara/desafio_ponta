import 'package:crud_ponta/app/repositories/farms/farms_repository.dart';
import 'package:crud_ponta/app/services/farms/farms_service.dart';

class FarmsServiceImpl implements FarmsService {
  final FarmsRepository _farmsRepository;

  FarmsServiceImpl({
    required FarmsRepository farmsRepository,
  }) : _farmsRepository = farmsRepository;

  @override
  Future<void> save(String name) => _farmsRepository.save(name);
}
