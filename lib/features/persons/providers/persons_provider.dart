import 'package:flutter/material.dart';

class PersonsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> persons = [
    {'name': 'Juan', 'edad': 25},
    {'name': 'Maria', 'edad': 30},
    {'name': 'Pedro', 'edad': 35},
  ];

  List<Map<String, dynamic>> get getPersons => persons;

  void addPerson(Map<String, dynamic> person) {
    persons.add(person);
    notifyListeners();
  }
}
