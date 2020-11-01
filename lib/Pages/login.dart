import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController userCtr=new TextEditingController();
  TextEditingController pwdCrt=new TextEditingController();

  String msg='';

  Future _login() async{
    var url="https://flutter5072.000webhostapp.com/login.php";
    var response=await http.post(url,body: {
      "username":userCtr.text,
      "password":pwdCrt.text,
    });

    var datausr=json.decode(response.body);
    if(datausr.length==0)
    {
      setState(() {
        msg="login failed";
      });
    }else{
      if(datausr[0]['role']=="1"){
        Navigator.pushReplacementNamed(context, 'Home');

      }else if(datausr[0]['role']=="0"){
        Navigator.pushReplacementNamed(context, 'Home');
      }
      setState(() {
        username=datausr[0]['username'];

      });
    }
    return datausr;
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
              child: Text("Login to your account",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w300),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top:23,bottom: 20),
              child: TextFormField(
                controller: userCtr,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email,color: Colors.blueAccent,size: 20,),
                  labelText: 'Username',
                  border:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top:1,bottom: 20),
              child: TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: pwdCrt,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: Colors.blueAccent,size: 20,),
                    labelText: 'Password',
                    border: null,
                    suffixIcon: Icon(Icons.remove_red_eye)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80,left: 80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 50,
                  child: new RaisedButton(
                      child: Text("Sign In",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
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
                Navigator.pushNamed(context, 'SignUp');
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: msg,
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
            )
          ],
        ),
      ),
    );
  }
}
