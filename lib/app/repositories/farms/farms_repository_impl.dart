import 'package:crud_ponta/app/core/database/sqlite_connection_factory.dart';
import 'package:crud_ponta/app/models/farm_model.dart';
import 'package:crud_ponta/app/repositories/farms/farms_repository.dart';

class FarmsRepositoryImpl implements FarmsRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  FarmsRepositoryImpl(
      {required SqliteConnectionFactory sqliteConnectionFactory})
      : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> save(String name) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.insert('farms', {
      'farm_id': null,
      'name': name,
    });
  }

  @override
  Future<List<FarmModel>> findAll() async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery('select * from farms');
    return result.map((e) => FarmModel.loadFromDB(e)).toList();
  }

  @override
  Future<void> update(FarmModel farmModel) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.rawUpdate('update farms set name = ? where id = ?',
        [farmModel.name, farmModel.farm_id]);
  }
}
