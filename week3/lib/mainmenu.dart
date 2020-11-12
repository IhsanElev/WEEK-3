import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:week3/viewBar/beritakesehatan.dart';
import 'package:week3/viewBar/home.dart';
import 'package:week3/viewBar/profile.dart';
import 'package:week3/viewBar/kamus.dart';

class mainmenu extends StatefulWidget {
  final VoidCallback signOut;

  mainmenu(this.signOut);

  @override
  _mainmenuState createState() => _mainmenuState();
}

enum LoginStatus { notSignIn, SignIn }

class _mainmenuState extends State<mainmenu> {
  String username = "", email = "";
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username');
      email = preferences.get('email');
      preferences.commit();
    });
  }

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Berita Kesehatan'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                signOut();
              },
              icon: Icon(Icons.block),
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            home(),
            News(),
            kamus(),
            Profile(),
          ],
//          child: Text("username: $username,\n email: $email"),
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: 'home',
            ),
            Tab(
              icon: Icon(Icons.new_releases),
              text: 'Berita',
            ),
            Tab(
              icon: Icon(Icons.category),
              text: 'Kamus',
            ),
            Tab(
              icon: Icon(Icons.person_pin),
              text: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}
