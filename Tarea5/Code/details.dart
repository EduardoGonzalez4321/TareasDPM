import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class DetailsPage extends StatelessWidget {
  final String itemDetails;

  const DetailsPage({Key? key, required this.itemDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dividir los detalles del elemento guardado en sus partes individuales
    List<String> details = itemDetails.split(', ');

    // Inicializar variables para detalles
    String name = '';
    String location = '';
    bool isInSeason = false;
    String notes = '';

    // Buscar y extraer cada detalle individual
    for (String detail in details) {
      if (detail.startsWith('Name: ')) {
        name = detail.substring(6); // Eliminar el prefijo 'Name: '
      } else if (detail.startsWith('Location: ')) {
        location = detail.substring(10); // Eliminar el prefijo 'Location: '
      } else if (detail.startsWith('Currently in season: ')) {
        isInSeason = detail.substring(21) == 'true'; // Convertir a booleano
      } else if (detail.startsWith('Notes: ')) {
        notes = detail.substring(7); // Eliminar el prefijo 'Notes: '
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 92, 19, 208),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (name.isNotEmpty) ...[
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text(
                  location,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.event),
                SizedBox(width: 8),
                Text(
                  isInSeason ? 'Currently in season' : 'Currently not in season',
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.menu),
                SizedBox(width: 8),
                Text(
                  notes,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}