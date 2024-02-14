import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Demo',
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String? _selectedItem;

  _MenuPageState() {
    _selectedItem = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Menu Demo',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Explore the restaurant's delicious menu items below!",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 20),
          buildMenuItem('Burger'),
          buildMenuItem('Hot Dog'),
          buildMenuItem('Fries'),
          buildMenuItem('Soda'),
          buildMenuItem('Ice Cream'),
          SizedBox(height: 15),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_selectedItem != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Pickup: $_selectedItem'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Pickup'),
            ),
            Container(
              width: 1,
              height: 30,
              color: Colors.grey,
            ),
            ElevatedButton(
              onPressed: () {
                if (_selectedItem != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delivery: $_selectedItem'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Delivery'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(String item) {
    bool isSelected = item == _selectedItem;
    return ListTile(
      contentPadding: EdgeInsets.only(left: 30.0),
      leading: FutureBuilder<Uint8List>(
        future: loadImage('assets/$item.png'),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return Image.memory(
              snapshot.data!,
              width: 48,
              height: 48,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      title: Text(
        item,
        style: TextStyle(
          fontSize: 25,
          color: isSelected ? Colors.blue : Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedItem = item;
        });
      },
    );
  }

  Future<Uint8List> loadImage(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    return data.buffer.asUint8List();
  }
}
