import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: home(),
  )
);


class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1604068769676-760f404ad9e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80`'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(150)),
                      
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text("LOGIN",style: TextStyle(
                            color: Colors.black,
                            fontSize: 22
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 30,top:23,bottom: 20),
                          child: TextFormField(

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

                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: Colors.blueAccent,size: 20,),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.blue)),
                              suffixIcon: Icon(Icons.remove_red_eye),
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
                                  }
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
        )
        ),
    );
  }
}
