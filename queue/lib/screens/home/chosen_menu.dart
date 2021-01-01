import 'package:flutter/material.dart';
import 'package:queue/models/Menus.dart';
import 'package:provider/provider.dart';
import 'package:queue/screens/home/menu_tile.dart';
import 'package:queue/models/user.dart';
import 'package:queue/services/database.dart';
import 'package:queue/shared/loading.dart';

class ChosenMenu extends StatefulWidget {
  @override
  _ChosenMenuState createState() => _ChosenMenuState();
}

class _ChosenMenuState extends State<ChosenMenu> {
  @override
    Widget build(BuildContext context) {
    
    final choseMenu = Provider.of<List<Menus>>(context) ?? [];

    return ListView.builder(
      itemCount: choseMenu.length,
      itemBuilder: (context, index){
        return MenuTile(menu: choseMenu[index]);
      } ,
    );
  }
}


