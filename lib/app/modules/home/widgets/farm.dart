import 'package:crud_ponta/app/models/farm_model.dart';
import 'package:flutter/material.dart';

class Farm extends StatelessWidget {
  final FarmModel farmModel;
  const Farm({super.key, required this.farmModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          title: Text(farmModel.name),
          subtitle: Text('10 animais'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1)),
        ),
      ),
    );
  }
}
