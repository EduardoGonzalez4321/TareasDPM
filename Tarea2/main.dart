import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 6, 41, 103),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Función para mostrar el Snackbar
  void _showSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  // Widget para los días de la semana
  Widget _buildDayContainer(BuildContext context, String day, IconData icon, String temperature, Color iconColor) {
    return GestureDetector(
      onTap: () {
        _showSnackbar(context, 'La temperatura para: $day es de $temperature');
      },
      child: Container(
        width: 380,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromARGB(255, 4, 22, 48),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(day, style: TextStyle(color: Colors.white)),
            Spacer(),
            //SizedBox(width: 60),
            Icon(icon, color: iconColor),
            SizedBox(width: 60),
            Text(temperature, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hourly forecast', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 6, 41, 103),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 380,
            height: 126,
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromARGB(255, 4, 22, 48),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("16°", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Icon(Icons.nights_stay, color: Colors.blue),
                    Text("Now", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("14°", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Icon(Icons.nights_stay, color: Colors.blue),
                    Text("12 AM", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("14°", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Icon(Icons.nights_stay, color: Colors.blue),
                    Text("1 AM", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("13°", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Icon(Icons.nights_stay, color: Colors.blue),
                    Text("2 AM", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("11°", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 30),
                    Icon(Icons.nights_stay, color: Colors.blue),
                    Text("3 AM", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Espacio entre el contenedor y el nuevo texto
          Text(
            '     7-day forecast',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 7),
          _buildDayContainer(context, 'Today', Icons.sunny, '28°/9°', Colors.yellow),
          SizedBox(height: 7),
          _buildDayContainer(context, 'Tuesday', CupertinoIcons.cloud_sun_fill, '27°/9°', Colors.grey),
          SizedBox(height: 7),
          _buildDayContainer(context, 'Wednesday', CupertinoIcons.cloud_sun_rain_fill, '26°/9°', Colors.grey),
          SizedBox(height: 7),
          _buildDayContainer(context, 'Thursday', Icons.sunny, '28°/8°', Colors.yellow),
          SizedBox(height: 7),
          _buildDayContainer(context, 'Friday', Icons.sunny, '28°/9°', Colors.yellow),
          SizedBox(height: 7),
          _buildDayContainer(context, 'Saturday', Icons.sunny, '29°/10°', Colors.yellow),
          SizedBox(height: 7),
          _buildDayContainer(context, 'Sunday', CupertinoIcons.cloud_moon_rain_fill, '29°/12°', Colors.grey),
        ],
      ),
    );
  }
}
