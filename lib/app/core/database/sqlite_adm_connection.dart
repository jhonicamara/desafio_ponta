import 'package:crud_ponta/app/core/database/sqlite_connection_factory.dart';
import 'package:flutter/widgets.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final connection = SqliteConnectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        // Caso o aplicativo seja inativado ou pausado, vou fechar a conexão com o Sqlite
        connection.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
