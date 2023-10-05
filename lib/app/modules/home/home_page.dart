import 'package:crud_ponta/app/core/notifier/default_listener_notifier.dart';
import 'package:crud_ponta/app/modules/farms/farms_module.dart';
import 'package:crud_ponta/app/modules/home/home_controller.dart';
import 'package:crud_ponta/app/modules/home/widgets/home_farms.dart';
import 'package:crud_ponta/app/modules/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;

  HomePage({Key? key, required HomeController homeController})
      : _homeController = homeController,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(changeNotifier: widget._homeController).listener(
      context: context,
      sucessCallback: (notifier, listenerInstance) {
        listenerInstance.dispose();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // O que está dentro dessa função, só será executado após a construção da página.
      widget._homeController.loadAllFarms();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _goToCreateFarm(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeInQuad);
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            FarmsModule().getPage('/farm/create', context),
      ),
    );

    widget._homeController.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ponta'),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFarms(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreateFarm(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
