import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  TextEditingController usr=new TextEditingController();
  TextEditingController mail=new TextEditingController();
  TextEditingController mob=new TextEditingController();
  TextEditingController pass=new TextEditingController();


  clearTextInput()
  {
    usr.clear();
    mail.clear();
    mob.clear();
    pass.clear();

  }

  String _username;
  String _email;
  String _mobile;
  String _password;


  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();


  void _register() {
    var url="https://flutter5072.000webhostapp.com/register.php";
      http.post(
          url,body:
                    {
                    "username":usr.text,
                    "email":mail.text,
                    "mobile":mob.text,
                    "password":pass.text
                    }
               );
  }

  Widget _buildUsername(){
    return Padding(
      padding: const EdgeInsets.only(right: 32,top: 20,left: 32),
      child: TextFormField(
        controller: usr,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person,color: Colors.blueAccent,size: 20,),
          labelText: 'Username',
          border: null,
        ),
        keyboardType: TextInputType.text,
        // ignore: missing_return
        validator: (String value){
          if(value.isEmpty)
          {
            return 'Username is required';
          }
        },
        onSaved: (String value){
          _username=value;
        },
      ),
    );
  }

  Widget _buildEmail(){
    return Padding(
      padding: const EdgeInsets.only(right: 32,top: 10,left: 32),
      child: TextFormField(
        controller: mail,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email,color: Colors.blueAccent,size: 20,),
          labelText: 'Email',
          border: null,
        ),
          keyboardType: TextInputType.emailAddress,
          // ignore: missing_return
          validator: (String value){
            // ignore: missing_return
            if(value.isEmpty)
            {
              return 'Email is required';
            }
            if(!RegExp("[^@\s]+@[^@\s]+\.[^@\s]+").hasMatch(value)){
                return 'Please Enter valid Email Address';
            }
            return null;
          },
          onSaved: (String value) {
            _email = value;
          }
      ),
    );
  }

  Widget _buildMobile(){
    return Padding(
      padding: const EdgeInsets.only(right: 32,top: 10,left: 32),
      child: TextFormField(
        controller: mob,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.call,color: Colors.blueAccent,size: 20,),
          labelText: 'Mobile',
          border: null,
        ),
          keyboardType: TextInputType.phone,
          // ignore: missing_return
          validator: (String value){
            // ignore: missing_return
            if(value.isEmpty)
            {
              return 'Mobile is required';
            }
          },
          onSaved: (String value) {
            _mobile = value;
          }
      ),
    );
  }
  
  Widget _buildPassword(){
    return Padding(
      padding: const EdgeInsets.only(right: 32,top: 10,left: 32),
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: "*",
        controller: pass,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock,color: Colors.blueAccent,size: 20,),
          labelText: 'Password',
          border: null,
        ),
          keyboardType: TextInputType.visiblePassword,
          // ignore: missing_return
          validator: (String value){
            // ignore: missing_return
            if(value.isEmpty)
            {
              return 'Password is required';
            }
          },
          onSaved: (String value) {
            _password = value;
          }
      ),
    );
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              BackButtonWidget(),
              _buildUsername(),
              _buildEmail(),
              _buildMobile(),
              _buildPassword(),
                Padding(
                padding: const EdgeInsets.only(top:20,right: 80,left: 80),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 50,
                    child: new RaisedButton(
                      onPressed: (){
                        if(!_formkey.currentState.validate()){
                          return;
                        }else{
                          _register();
                          clearTextInput();
                          Navigator.pushNamed(context, 'SignIn');

                        }
                        _formkey.currentState.save();
                      },
                      child: Text("Sign up",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),),
                      color: Colors.blueAccent.shade400,
                    ),
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



class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(100)),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/bg1.jpg'))),
      child: Positioned(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 40,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Positioned(
                bottom: 20,
                left: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Create New Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              )
            ],
          )),
    );
  }
}


