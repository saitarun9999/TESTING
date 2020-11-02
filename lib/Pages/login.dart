import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController mobileCtr=new TextEditingController();
  TextEditingController pwdCrt=new TextEditingController();

  String msg='';

  Future _login() async{
    var url="https://flutter5072.000webhostapp.com/login.php";
    var response=await http.post(url,body: {
      "mobile":mobileCtr.text,
      "password":pwdCrt.text,
    });

    var dataUsr=json.decode(response.body);
    if(dataUsr.length==0)
    {
      setState(() {
        msg="Invalid username & password";
      });
    }else{
      if(dataUsr[0]['role']=="1"){
        Navigator.pushReplacementNamed(context, '/Home');

      }else if(dataUsr[0]['role']=="0"){
        Navigator.pushReplacementNamed(context, '/Home');
      }
      setState(() {
        username=dataUsr[0]['username'];

      });
    }
    return dataUsr;
  }


  Path getClip(Size size){
    var path=new Path();
    path.lineTo(0, size.height-50);
    var controlPoint=Offset(50, size.height);
    var endPoint=Offset(size.width/2,size.height);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx,endPoint.dy);
    return path;
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(100)),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('assets/images/bg1.jpg')))
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text("Login to your account",style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w300),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 5,left: 30,right: 30),
              child: TextFormField(
                controller: mobileCtr,
                decoration: InputDecoration(
                    fillColor: Colors.blueAccent,
                    prefixIcon: Icon(Icons.call,color: Colors.blueAccent,size: 20,),
                    labelText: 'Enter Mobile',
                    border:  InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2,left: 30,right: 30),
              child: TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: pwdCrt,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.blueAccent,size: 20,),
                  labelText: 'Enter Password',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'ForgetPassword?');
              },
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                    ]
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 35,
                  child: new RaisedButton(
                      child: Text("LOGIN",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),),
                      color: Colors.blueAccent.shade400,
                      onPressed: (){
                        _login();
                      }
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/SignUp');
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: "Don't have an Account?",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ]
                  ),
                ),
              ),
            ),
            SizedBox(
              height:5,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    text: msg,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
