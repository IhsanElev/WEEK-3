import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:week3/register.dart';
import 'package:week3/walpaper.dart';

import 'constant/constant.dart';
import 'mainmenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, SignIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email;
  String password;

  final _key = new GlobalKey<FormState>();
  bool _secureText = true;
  showhide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          appBar: AppBar(
            title: Text('BERITA KESEHATAN'),
          ),
          body: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        return "isi email";
                      }
                    },
                    onSaved: (e) => email = e,
                    decoration: InputDecoration(labelText: "email"),
                  ),
                  TextFormField(
                    validator: (e) {
                      if (e.isEmpty) {
                        return "isi password";
                      }
                    },
                    obscureText: _secureText,
                    onSaved: (e) => password = e,
                    decoration: InputDecoration(
                        labelText: "password",
                        suffixIcon: IconButton(
                          onPressed: showhide,
                          icon: Icon(_secureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                  ),
                  MaterialButton(
                    onPressed: () {
                      check();
                    },
                    child: Text("login"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      'Registrasi Sekarang',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => walpaper()));
                      },
                      child: Text('ke walpaper'))
                ],
              ),
            ),
          ),
        );
        break;
      case LoginStatus.SignIn:
        return mainmenu(signOut);
    }
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post(BaseUrl().login, body: {
      "email": email,
      "password": password,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String usernameAPI = data['username'];
    String emailAPI = data['email'];
    String id_users = data['id_users'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.SignIn;

        savePref(value, usernameAPI, emailAPI, id_users);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(int value, String username, String email, String id_users) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString('username', username);
      preferences.setString('email', email);
      preferences.setString('id_users', id_users);
      preferences.commit();
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      var value = preferences.getInt("value");
      _loginStatus = value == 1 ? LoginStatus.SignIn : LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }
}
