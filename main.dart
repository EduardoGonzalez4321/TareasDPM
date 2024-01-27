import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Mc Flutter', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
          ),
          body: IconColorChanger(),
        ),
      ),
    );
  }
}

class IconColorChanger extends StatefulWidget {
  @override
  _IconColorChangerState createState() => _IconColorChangerState();
}

class _IconColorChangerState extends State<IconColorChanger> {
  Color icon1Color = Colors.black;
  Color icon2Color = Colors.black;
  Color icon3Color = Colors.black;
  Color icon4Color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 380,
          height: 150,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 70.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Icono de persona en un círculo
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 20.0,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 18.0,
                          ),
                        ),
                        SizedBox(width: 5.0), // Espaciado entre el icono y el texto
                        // Texto
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            "Flutter McFlutter",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.0, // Ajusta el valor según tus necesidades
                left: 105.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Experienced App Developer",
                    style: TextStyle(fontSize: 12.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                top: 60.0, // Ajusta el valor según tus necesidades
                left: 0.0,
                child: Container(
                  child: Text(
                    "123 Main Street",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Positioned(
                top: 60.0,
                left: 260.0,
                child: Container(
                  child: Text(
                    "(415) 555-0198",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.accessibility),
                        color: icon1Color,
                        onPressed: () {
                          setState(() {
                            icon1Color =
                                icon1Color == Colors.black ? Colors.indigo : Colors.black;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.alarm),
                        color: icon2Color,
                        onPressed: () {
                          setState(() {
                            icon2Color =
                                icon2Color == Colors.black ? Colors.indigo : Colors.black;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.phone_iphone),
                        color: icon3Color,
                        onPressed: () {
                          setState(() {
                            icon3Color =
                                icon3Color == Colors.black ? Colors.indigo : Colors.black;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.phone_iphone),
                        color: icon4Color,
                        onPressed: () {
                          setState(() {
                            icon4Color =
                                icon4Color == Colors.black ? Colors.indigo : Colors.black;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
