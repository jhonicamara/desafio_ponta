import 'package:crud_ponta/app/modules/home/widgets/farm.dart';
import 'package:flutter/material.dart';

class HomeFarms extends StatelessWidget {
  const HomeFarms({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Olhas elas aqui'),
          Column(
            children: [
              Farm(),
              Farm(),
              Farm(),
              Farm(),
              Farm(),
              Farm(),
              Farm(),
              Farm(),
              Farm(),
              Farm(),
              Farm(),
            ],
          ),
        ],
      ),
    );
  }
}
