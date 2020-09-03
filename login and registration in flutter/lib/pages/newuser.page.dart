import 'package:flutter/material.dart';

import 'package:freedom/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedom/pages/login.page.dart';

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _auth = FirebaseAuth.instance;
  String name, email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.lightBlue[300]]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 35, left: 10),
                      child: RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            'Sing up',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 07.0, left: 15.0),
                      child: Container(
                        //color: Colors.green,
                        height: 200,
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 60,
                            ),
                            Center(
                              child: Text(
                                'Freedom',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'DancingScript',
                                    fontSize: 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        name = value; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.lightBlueAccent,
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 01, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        email = value; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.lightBlueAccent,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 01, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        password = value; //get the value entered by user.
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[300],
                            blurRadius:
                                10.0, // has the effect of softening the shadow
                            spreadRadius:
                                1.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: FlatButton(
                      onPressed: () async {
                        try {
                          final newuser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newuser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
                        } catch (e) {}
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Signup',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account ?',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xfff79c4f),
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
