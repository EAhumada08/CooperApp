import 'package:cooper_app/models/event.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> events = [];

  List<Event> get getEvents => events;

  void addEvent(Event event) {
    events.add(event);
    notifyListeners();
  }
}
