import 'package:crud_ponta/app/core/database/sqlite_connection_factory.dart';
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
      'id': null,
      'name': name,
    });
  }
}
