import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  bool _isCurrentlyInSeason = false;
  List<String> _items = [];

  int get count => _count;
  bool get isCurrentlyInSeason => _isCurrentlyInSeason;
  List<String> get items => _items;

  void increment() {
    _count++;
    notifyListeners();
  }

  void setCurrentlyInSeason(bool value) {
  _isCurrentlyInSeason = value;
  notifyListeners(); // Notificar a los escuchadores del cambio en el estado
}

  void clearFields(TextEditingController nameController, TextEditingController locationController, TextEditingController notesController) {
    _count = 0;
    _isCurrentlyInSeason = false;
    nameController.clear();
    locationController.clear();
    notesController.clear();
    notifyListeners();
  }

  // Método para agregar un nuevo elemento
  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }
}

class AppState extends StatelessWidget {
  final Widget child;

  const AppState({required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: child,
    );
  }
}