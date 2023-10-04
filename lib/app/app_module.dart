import 'package:crud_ponta/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});
  /**
   * O AppModule é o modulo core da aplicação, dentro fica todas as classes que
   * serão compartilhadas por vários modulos.
   * 
   * A ideia de termos um modulo, e ele tem suas dependencias. Quanto o modulo 
   * estiver vivo ele tem as dependencias e classes ativas. Quando o modulo morrer
   * automaticamente essas classes também morrem. 
   * 
   * Se elas estivessem na camada principal,  elas sempre estariam ativas na memoria
   * do sistema, gastando memoria desnecessariamente 
   * 
   * AppModule so terá o necessário para ficar ativo no sistema como um todo e a
   * todo momento.
   * 
   */

  @override
  Widget build(BuildContext context) {
    // Com o MultiProvider,
    return MultiProvider(
      providers: [Provider(create: (_) => Object())],
      child: AppWidget(),
    );
  }
}
