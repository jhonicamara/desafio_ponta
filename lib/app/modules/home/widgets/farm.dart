import 'package:flutter/material.dart';

class Farm extends StatelessWidget {
  const Farm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey),
          ]),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          title: Text('Fazenda do Jão'),
          subtitle: Text('10 animais'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1)),
        ),
      ),
    );
  }
}
