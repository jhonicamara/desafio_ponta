import 'package:flutter/material.dart';

class CrudPontLogo extends StatelessWidget {
  const CrudPontLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/ponta_logo.jpeg',
          height: 200,
        )
      ],
    );
  }
}
