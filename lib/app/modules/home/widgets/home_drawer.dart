import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Row(
              children: [
                Text('CRUD PONTA'),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text('Fazendas'),
          ),
          ListTile(
            onTap: () {},
            title: Text('Animais'),
          )
        ],
      ),
    );
  }
}
