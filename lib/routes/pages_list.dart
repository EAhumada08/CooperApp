import 'package:cooper_app/features/events/screens/list_events_page.dart';
import 'package:cooper_app/features/persons/screens/list_persons_page.dart';
import 'package:flutter/material.dart';

List<Widget> pagesList = <Widget>[ListPersonsPage(), ListEventsPage()];

List<Tab> tabsBarList = <Tab>[
  Tab(icon: Icon(Icons.person)),
  Tab(icon: Icon(Icons.event)),
];
