import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class HomePage extends StatelessWidget {

  HomePage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarButtonWidget(),
              Container(
                   width:500,
                       height: 500,
                       child: Card(
                         shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                               ),
                            color: Colors.grey,
                              elevation: 0,
                                 child: Column(
                                   children: <Widget>[



                                                ],
                                              ),
                                          ),
                                        ),
                                        ],
                                        ),
        ),
      ),
    );
  }
}

class AppbarButtonWidget extends StatelessWidget {

  const AppbarButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/bg1.jpg'))),
      child: Positioned(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 20,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,'SignIn');
                          }
                      ),
                      Text(
                        '$username',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                        letterSpacing: 5),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
  }