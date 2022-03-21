// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'dart:async';
// import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('Hello Sharaf'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: () {
              // ignore: avoid_print
              print('Hi Sharaf');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: 420.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://www.logowik.com/content/uploads/images/google-logo-2020.jpg',
                      ),
                      width: 420.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30.0,
                        horizontal: 10.0,
                      ),
                      width: 420.0,
                      color: Colors.pink.withOpacity(0.3),
                      child: Text(
                        'Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
