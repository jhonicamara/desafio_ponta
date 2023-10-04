import 'package:crud_ponta/app/core/modules/crud_ponta_module.dart';
import 'package:crud_ponta/app/modules/farms/farm_create_controller.dart';
import 'package:crud_ponta/app/modules/farms/farm_create_page.dart';
import 'package:provider/provider.dart';

class FarmsModule extends CrudPontaModule {
  FarmsModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => FarmCreateController(),
            )
          ],
          routers: {
            '/farm/create': (context) => FarmCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
