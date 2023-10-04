import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Suas fazendas',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
