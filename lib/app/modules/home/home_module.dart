import 'package:crud_ponta/app/core/modules/crud_ponta_module.dart';
import 'package:crud_ponta/app/modules/home/home_controller.dart';
import 'package:crud_ponta/app/modules/home/home_page.dart';
import 'package:crud_ponta/app/repositories/farms/farms_repository.dart';
import 'package:crud_ponta/app/repositories/farms/farms_repository_impl.dart';
import 'package:crud_ponta/app/services/farms/farms_service.dart';
import 'package:crud_ponta/app/services/farms/farms_service_impl.dart';
import 'package:provider/provider.dart';

class HomeModule extends CrudPontaModule {
  HomeModule()
      : super(
          bindings: [
            Provider<FarmsRepository>(
              create: (context) =>
                  FarmsRepositoryImpl(sqliteConnectionFactory: context.read()),
            ),
            Provider<FarmsService>(
              create: (context) =>
                  FarmsServiceImpl(farmsRepository: context.read()),
            ),
            ChangeNotifierProvider(
              create: (context) => HomeController(farmsService: context.read()),
            )
          ],
          routers: {
            '/home': (context) => HomePage(
                  homeController: context.read(),
                ),
          },
        );
}
