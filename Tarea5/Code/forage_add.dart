import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController notesController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 92, 19, 208),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Location:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Enter location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Consumer<CounterModel>(
                  builder: (context, counterModel, child) => Checkbox(
                    value: counterModel.isCurrentlyInSeason,
                    onChanged: (value) {
                      counterModel.setCurrentlyInSeason(value ?? false);
                    },
                  ),
                ),
                Text(
                  'Currently in season',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Notes:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: notesController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Enter notes',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Guardar los datos ingresados
                    String name = nameController.text;
                    String location = locationController.text;
                    String notes = notesController.text;

                    // Verificar que los campos no estén vacíos
                    if (name.isNotEmpty &&
                        location.isNotEmpty &&
                        notes.isNotEmpty) {
                      // Obtener instancia del modelo
                      CounterModel counterModel =
                          Provider.of<CounterModel>(context, listen: false);

                      // Agregar el nuevo elemento a la lista
                      counterModel.addItem(
                          'Name: $name, Location: $location, Notes: $notes');

                      // Limpiar los campos
                      counterModel.clearFields(
                          nameController, locationController, notesController);

                      // Regresar a la página anterior (MyHomePage)
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Save'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterModel>(context, listen: false)
                        .clearFields(
                      nameController,
                      locationController,
                      notesController,
                    ); // Llama al método para borrar los campos
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
