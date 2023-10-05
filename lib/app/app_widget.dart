import 'package:crud_ponta/app/core/database/sqlite_adm_connection.dart';
import 'package:crud_ponta/app/core/navigator/crud_ponta_navigator.dart';
import 'package:crud_ponta/app/modules/farms/farms_module.dart';
import 'package:crud_ponta/app/modules/home/home_module.dart';
import 'package:crud_ponta/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  var sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Ponta',
      navigatorKey: CrudPontaNavigator.navigatorKey,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      initialRoute: '/home',
      routes: {
        ...HomeModule().routers,
        ...FarmsModule().routers,
      },
      home: SplashPage(),
    );
  }
}
