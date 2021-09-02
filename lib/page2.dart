import 'dart:async';

import 'package:ecomstore/page2.dart';
import 'package:ecomstore/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'page3.dart';
import 'page1.dart';
import 'main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'dart:io';
import 'dart:ui';
import 'package:ecomstore/page1.dart';
import 'package:ecomstore/page2.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:firebase/firebase.dart';

class page2 extends StatefulWidget {
  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {
  int _currentIndex = 2;
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
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
                size: 30.0,
              ),
              splashColor: Colors.teal[200],
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: 'Menu',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 30.0,
                ),
                splashColor: Colors.teal[200],
                onPressed: () => exit(null),
                tooltip: 'Mic',
              ),
              SizedBox(
                height: 15.0,
                width: 15.0,
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 30.0,
                ),
                splashColor: Colors.teal[200],
                onPressed: () => exit(null),
                tooltip: 'Cart',
              ),
              SizedBox(
                width: 11.0,
                height: 11.0,
              ),
            ],
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                }),
            backgroundColor: Colors.teal[300],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            elevation: 50.0,
            backgroundColor: Colors.teal[300],
            unselectedItemColor: Colors.teal[300],
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_sharp,
                  color: Colors.black,
                  size: 25.0,
                ),
                label: 'Home',
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_sharp,
                    color: Colors.black,
                    size: 25.0,
                  ),
                  label: 'Category',
                  title: Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'images/wishlist.png',
                    ),
                    size: 25.0,
                    color: Colors.black,
                  ),
                  label: 'Wishlist',
                  title: Text(
                    'Wishlist',
                    style: TextStyle(
                      color: Colors.black,
                      // background: Paint()..color=Colors.red..style=PaintingStyle.stroke
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_sharp,
                    color: Colors.black,
                    size: 25.0,
                  ),
                  tooltip: 'Profile',
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                if (_currentIndex == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                } else if (_currentIndex == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => page1()));
                } else if (_currentIndex == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => page2()));
                } else if (_currentIndex == 3) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => page3()));
                }
              });
            },
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(),
            ),
          ),
        ),
      ),
    );
  }
}
