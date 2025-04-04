import 'package:cooper_app/models/person.dart';
import 'package:flutter/material.dart';

class PersonsProvider extends ChangeNotifier {
  List<Person> persons = [];

  List<Person> get getPersons => persons;

  void addPerson(Person person) {
    persons.add(person);
    notifyListeners();
  }
}
