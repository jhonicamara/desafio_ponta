import 'package:crud_ponta/app/core/database/migrations/migration.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table fazendas(
        fazenda_id Integer primary key autoincrement,
        nome varchar(500) not null,
      )

      create table animais(
        animal_id Integer primary key autoincrement,
        tag_identificacao varchar(15) not null,
        FOREIGN KEY(animal_fazenda_id) REFERENCES fazendas(fazenda_id)
      )
    ''');
  }

  @override
  void update(Batch batch) {
    // TODO: implement update
  }
}
