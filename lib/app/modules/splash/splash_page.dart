import 'package:crud_ponta/app/core/widgets/crud_pont_logo.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CrudPontLogo(),
      ),
    );
  }
}
