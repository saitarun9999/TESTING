import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class HomePage extends StatelessWidget {

  HomePage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarButtonWidget(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 400,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:4,
                      childAspectRatio: 3/3,
                    ),
                    children: [
                      _gridItem(AssetImage("assets/images/Home.png"),"Home"),
                      _gridItem(AssetImage("assets/images/About.png"),"About"),
                      _gridItem(AssetImage("assets/images/Audio.png"),"Audio"),
                      _gridItem(AssetImage("assets/images/Card.png"),"Card"),
                      _gridItem(AssetImage("assets/images/contact.png"),"contact"),
                      _gridItem(AssetImage("assets/images/Events.png"),"Events"),
                      _gridItem(AssetImage("assets/images/Donate.png"),"Donate"),
                      _gridItem(AssetImage("assets/images/Holy-bible.png"),"Holy-bible"),
                      _gridItem(AssetImage("assets/images/Feedback.png"),"Feedback"),
                      _gridItem(AssetImage("assets/images/Fm.png"),"Fm"),
                      _gridItem(AssetImage("assets/images/Gallery.png"),"Gallery"),
                      _gridItem(AssetImage("assets/images/Directory.png"),"Directory"),
                      _gridItem(AssetImage("assets/images/Home.png"),"Home"),
                      _gridItem(AssetImage("assets/images/About.png"),"About"),
                      _gridItem(AssetImage("assets/images/Audio.png"),"Audio"),
                      _gridItem(AssetImage("assets/images/Card.png"),"Card"),
                      _gridItem(AssetImage("assets/images/contact.png"),"contact"),
                      _gridItem(AssetImage("assets/images/Events.png"),"Events"),
                      _gridItem(AssetImage("assets/images/Donate.png"),"Donate"),
                      _gridItem(AssetImage("assets/images/Holy-bible.png"),"Holy-bible"),
                      _gridItem(AssetImage("assets/images/Feedback.png"),"Feedback"),
                      _gridItem(AssetImage("assets/images/Fm.png"),"Fm"),
                      _gridItem(AssetImage("assets/images/Gallery.png"),"Gallery"),
                      _gridItem(AssetImage("assets/images/Directory.png"),"Directory"),
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


_gridItem(image,text){
  return Column(
    children: [
      InkWell(
        onTap: (){},
        child:Image(
              image: image,
              height: 50,
              width: 50,
       ),
        ),
      SizedBox(height: 2,),
      Text(text,
      style: TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      )
    ],
  );
}

class AppbarButtonWidget extends StatelessWidget {

  const AppbarButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(100)),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/bg2.jpg'))

      ),
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
                            Navigator.pushReplacementNamed(context,'/SignIn');
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