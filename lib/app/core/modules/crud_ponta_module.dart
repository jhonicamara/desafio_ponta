import 'package:crud_ponta/app/core/modules/crud_ponta_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';

/**
 * Para evitar a repetição de código na declaração das rotas no AppWidget.dart
 * Defini essa classe abstrata que fica responsável por formatar as rotas encapusulando
 * os providers necessários evitando muita verbosidade.
 * 
 *  */ //

abstract class CrudPontaModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  CrudPontaModule(
      {List<SingleChildWidget>? bindings,
      required Map<String, WidgetBuilder> routers})
      : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => CrudPontaPage(
          bindings: _bindings,
          page: pageBuilder,
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];
    if (widgetBuilder != null) {
      return CrudPontaPage(
        page: widgetBuilder,
        bindings: _bindings,
      );
    }
    throw Exception();
  }
}
