import 'package:flutter/widgets.dart';

class CrudPontaNavigator {
  CrudPontaNavigator._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState? get to => navigatorKey.currentState;
}
