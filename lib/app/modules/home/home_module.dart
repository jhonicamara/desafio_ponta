import 'package:crud_ponta/app/core/modules/crud_ponta_module.dart';
import 'package:crud_ponta/app/modules/home/home_controller.dart';
import 'package:crud_ponta/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeModule extends CrudPontaModule {
  HomeModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => HomeController(),
            )
          ],
          routers: {
            '/home': (context) => HomePage(),
          },
        );
}
