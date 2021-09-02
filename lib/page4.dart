import 'dart:io';
import 'dart:ui';
import 'package:ecomstore/page1.dart';
import 'package:ecomstore/page2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:firebase/firebase.dart';

class page4 extends StatefulWidget {
  @override
  _page4State createState() => _page4State();
}

class _page4State extends State<page4> {
  String email, password;
  final _auth = FirebaseAuth.instance;
  // if(email==)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ecomstore",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 68.0,
            title: FlatButton(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Image.asset(
                  'images/amazon.png',
                  width: 122.0,
                  height: 122.0,
                  color: Colors.black,
                ),
                splashColor: Colors.teal[200],
                onPressed: () {}),
            backgroundColor: Colors.teal[300],
          ),
          body: SingleChildScrollView(
            child: WillPopScope(
              onWillPop: () async {
                bool res = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Confirm Exit'),
                          content:
                              Text('Are you Sure you want to close this app?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text('Yes')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('No')),
                          ],
                        ));
                return Future.value(res);
              },
              child: SafeArea(
                child: Column(children: [
                  SizedBox(
                    height: 170.0,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 64.0,
                    ),
                    Column(children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                        width: 280,
                        height: 40,
                        child: TextField(
                          toolbarOptions: ToolbarOptions(
                            cut: true,
                            copy: true,
                            paste: true,
                            selectAll: true,
                          ),
                          decoration: InputDecoration(
                            icon: SizedBox(
                              width: 18.0,
                              child: SizedBox(
                                width: 18.0,
                                child: Icon(
                                  Icons.mail_sharp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            hintText: 'Email Address',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          showCursor: true,
                          cursorColor: Colors.black,
                          cursorHeight: 25.0,
                          onChanged: (value) {
                            setState(() {
                              email = value.trim();
                            });
                          },
                        ),
                      ),
                    ]),
                  ]),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 64.0,
                    ),
                    Column(children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                        width: 280,
                        height: 40,
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          toolbarOptions: ToolbarOptions(
                            cut: false,
                            copy: false,
                            paste: false,
                            selectAll: true,
                          ),
                          decoration: InputDecoration(
                            icon: SizedBox(
                              width: 18.0,
                              child: SizedBox(
                                width: 18.0,
                                child: Icon(
                                  Icons.lock_sharp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            hintText: 'Password',
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          showCursor: true,
                          cursorColor: Colors.black,
                          cursorHeight: 25.0,
                          onChanged: (value) {
                            setState(() {
                              password = value.trim();
                            });
                          },
                        ),
                      ),
                    ]),
                  ]),
                  SizedBox(
                    height: 40.0,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.all(0.0),
                    child: Row(children: [
                      SizedBox(
                        width: 64.0,
                      ),
                      Column(children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                          width: 280,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                              color: Colors.orange[300],
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 9.0,
                                    spreadRadius: 1.0)
                              ]),
                          child: Column(children: [
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              'SIGN UP',
                              style:
                                  TextStyle(fontSize: 21.0, letterSpacing: 5.0),
                            ),
                          ]),
                        ),
                      ]),
                    ]),
                    onPressed: () {
                      try {
                        final user = _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        }
                      } catch (e) {
                        print(e);
                        Text('Invalid!!!');
                      }
                    },
                  ),
                  Divider(
                    height: 40.0,
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                  InkWell(
                      child: Image(
                        image: AssetImage('images/google-sign-in.png'),
                        height: 60.0,
                      ),
                      onTap: () {}),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
