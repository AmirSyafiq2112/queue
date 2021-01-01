import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue/models/Menus.dart';
import 'package:queue/models/user.dart';
import 'package:queue/services/database.dart';
import 'package:queue/shared/loading.dart';

class MenuTile extends StatelessWidget {

  final Menus menu;
  MenuTile({this.menu});


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

        if(snapshot.hasData){

          UserData userData = snapshot.data;
          //print(userData.uid);
          print(menu.uid);

          if(userData.uid != menu.uid){
            return Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.red[100],
                  ),
                  title: Text(menu.name),
                  subtitle: Text('RM ${menu.price}'),
                ),
              ),
            );
          }else{
            return Loading();
          }

        }else{
          return Loading();
        }

      }
    );
  }
}
