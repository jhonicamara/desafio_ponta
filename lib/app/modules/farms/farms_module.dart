import 'package:crud_ponta/app/core/modules/crud_ponta_module.dart';
import 'package:crud_ponta/app/modules/farms/farm_create_controller.dart';
import 'package:crud_ponta/app/modules/farms/farm_create_page.dart';
import 'package:crud_ponta/app/repositories/farms/farms_repository.dart';
import 'package:crud_ponta/app/repositories/farms/farms_repository_impl.dart';
import 'package:crud_ponta/app/services/farms/farms_service.dart';
import 'package:crud_ponta/app/services/farms/farms_service_impl.dart';
import 'package:provider/provider.dart';

class FarmsModule extends CrudPontaModule {
  FarmsModule()
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
              create: (context) =>
                  FarmCreateController(farmsService: context.read()),
            )
          ],
          routers: {
            '/farm/create': (context) => FarmCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
