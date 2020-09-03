import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freedom/pages/login.page.dart';

Future fetchStr() async {
  await new Future.delayed(const Duration(seconds: 5), () {});
  return HomePage();
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logOut() async {
    FirebaseUser user = auth.signOut() as FirebaseUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                logOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
              },
              icon: Icon(Icons.person),
              label: Text("Logout"))
        ],
      ),
      body: Container(
        child: Center(child: Text('Welcome', style: TextStyle(fontSize: 32.0))),
      ),
    );
  }
}
