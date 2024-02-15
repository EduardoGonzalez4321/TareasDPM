import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String exchangeName;
  final String exchangeDescription;
  final String date;

  DetailsPage({
    Key? key,
    required this.image,
    required this.exchangeName,
    required this.exchangeDescription,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mostrar la imagen
            if (image.isNotEmpty)
              Container(
                alignment: Alignment.topCenter,
                child: ClipOval(
                  child: Image.network(
                    image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 16),
            // Mostrar el nombre del exchange
            Text(
              exchangeName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Mostrar la fecha de establecimiento
            Text(
              "Fecha de Establecimiento: $date",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            // Mostrar la descripción del exchange
            Text(
              exchangeDescription,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
