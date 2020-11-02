
import 'package:flutter/material.dart';
import 'Pages/homepage.dart';
import 'Pages/login.dart';
import 'Pages/register.dart';


void main() => runApp(MyApp());

String username='';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Screen ',
      debugShowCheckedModeBanner: false,
      initialRoute: 'SignIn',
      routes: {
        'SignIn':(context)=>Login(),
        'SignUp':(context)=>Register(),
        'Home':(context)=>HomePage(username: username,),
      },
    );
  }
}