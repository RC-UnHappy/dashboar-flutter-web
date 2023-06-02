import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/drawer_list_tile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                radius: 25, 
                backgroundImage: AssetImage(
                  'assets/images/photo3.jpg',
                ), 
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
                child: Divider(
                  color: grey,
                  thickness: 0.2,
                ),
              ),
              Text(
                'Developer',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Front end developer'),
            ]),
          ),
          DrawerListTile(title: 'Dashboard', icon: Icons.home, tap: () {}),
          DrawerListTile(title: 'Logging', icon: Icons.replay_10, tap: () {}),
          DrawerListTile(
              title: 'Clientes', icon: Icons.people_sharp, tap: () {}),
          DrawerListTile(
              title: 'Instalaciones', icon: Icons.build_sharp, tap: () {}),
          DrawerListTile(title: 'Tareas', icon: Icons.list, tap: () {}),
          DrawerListTile(
              title: 'Inventario', icon: Icons.inventory, tap: () {}),
          DrawerListTile(title: 'Finanzas', icon: Icons.money, tap: () {}),
          DrawerListTile(title: 'Mapas', icon: Icons.map, tap: () {}),
          DrawerListTile(title: 'ISP', icon: Icons.wifi, tap: () {}),
          DrawerListTile(title: 'Usuarios', icon: Icons.person, tap: () {}),
          DrawerListTile(title: 'Backunps', icon: Icons.storage, tap: () {}),
          DrawerListTile(title: 'Ajustes', icon: Icons.settings, tap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
