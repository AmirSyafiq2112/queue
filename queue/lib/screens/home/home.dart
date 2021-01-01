import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:queue/services/database.dart';
import 'package:queue/screens/home/chosen_menu.dart';
import 'package:queue/models/Menus.dart';
import 'package:queue/models/user.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamProvider<List<Menus>>.value(
      value: DatabaseService().menus ,
        child: Scaffold(
          backgroundColor: Colors.red[500],
          appBar: AppBar(
            title: Text('Welcome to KFC'),
            backgroundColor: Colors.red[100],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
          body: ChosenMenu(),
        ),
    );
  }
}
