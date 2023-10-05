import 'package:crud_ponta/app/core/database/sqlite_migration_factory.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart';

class SqliteConnectionFactory {
  static const _VERSION = 1;
  static const _DATABASE_NAME = 'PONTA';

  // Singleton - Uma unica instância para o sistema todo.
  static SqliteConnectionFactory? _instance;

  Database? _db; // É quem vai controlar meu banco (Controlar conexão)
  final _lock =
      Lock(); // Permite trabalhar com multi-thread | Permite que eu defina que seja aberta uma unica conexão do banco

  SqliteConnectionFactory._(); // Construtor privado

  factory SqliteConnectionFactory() {
    // Vai constrolar a minha instância
    // Se _instance for nulo, ele chama o construtor do método.
    _instance ??= SqliteConnectionFactory._();

    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _DATABASE_NAME);
    print(databasePathFinal);
    if (_db == null) {
      await _lock.synchronized(() async {
        // Com o synchronized eu informo que desejo que o APP aguarde esse processo acontecer
        // Se o _db for nulo, abrir o database
        _db ??= await openDatabase(
          databasePathFinal,
          version: _VERSION,
          onConfigure: _onConfigure,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onDowngrade: _onDowngrade,
        );
      });
    }
    return _db!;
  }

  void closeConnection() async {
    _db?.close();
    _db = null;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getCreateMigration();

    for (var migration in migrations) {
      migration.create(batch);
    }

    batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getUpgradedMigration(version);

    for (var migration in migrations) {
      migration.update(batch);
    }

    batch.commit();
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int version) async {}
}
