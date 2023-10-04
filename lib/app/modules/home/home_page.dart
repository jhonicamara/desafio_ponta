import 'package:crud_ponta/app/modules/farms/farms_module.dart';
import 'package:crud_ponta/app/modules/home/widgets/home_drawer.dart';
import 'package:crud_ponta/app/modules/home/widgets/home_farms.dart';
import 'package:crud_ponta/app/modules/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToCreateFarm(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
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
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ponta'),
      ),
      drawer: HomeDrawer(),
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
