import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'details.dart';
import 'forage_add.dart'; // Importa la página de detalles

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 92, 19, 208),
      ),
      body: Consumer<CounterModel>(
        builder: (context, counterModel, child) {
          List<String> items = counterModel.items;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              if (index < items.length) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage(itemDetails: items[index])),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        title: Text(
                          items[index].split(', ')[0], // Extrae el nombre
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          items[index].split(', ')[1], // Extrae la ubicación
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox(); // Devolver un widget vacío si el índice no es válido
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}