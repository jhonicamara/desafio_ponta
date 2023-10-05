import 'package:crud_ponta/app/core/database/migrations/migration.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table farms(
        farm_id Integer primary key autoincrement,
        name varchar(500) not null
      );
      create table animals(
        animal_id Integer primary key autoincrement,
        tag varchar(15) not null,
        FOREIGN KEY(animal_farm_id) REFERENCES farms(farm_id)
      );
    ''');
  }

  @override
  void update(Batch batch) {
    // TODO: implement update
  }
}
