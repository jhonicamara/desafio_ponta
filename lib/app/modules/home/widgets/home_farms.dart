import 'package:crud_ponta/app/models/farm_model.dart';
import 'package:crud_ponta/app/modules/home/home_controller.dart';
import 'package:crud_ponta/app/modules/home/widgets/farm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            children: context.select<HomeController, List<Farm>>(
              (controller) => controller.allFarms
                  .map(
                    (farm) => Farm(
                      farmModel: farm,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
