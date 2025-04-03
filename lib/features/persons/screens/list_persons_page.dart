import 'package:cooper_app/features/persons/providers/persons_provider.dart';
import 'package:cooper_app/features/persons/screens/add_person_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPersonsPage extends StatefulWidget {
  const ListPersonsPage({super.key});

  @override
  State<ListPersonsPage> createState() => _ListPersonsPageState();
}

class _ListPersonsPageState extends State<ListPersonsPage> {
  @override
  Widget build(BuildContext context) {
    var personsState = context.watch<PersonsProvider>();
    List<Map<String, dynamic>> persons = personsState.getPersons;

    return Scaffold(
      body: ListView(
        children: [
          for (var person in persons)
            ListTile(
              title: Text(person['name']),
              subtitle: Text(person['edad'].toString()),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => AddPersonPage(),
                ),
              ),
            },
        child: Icon(Icons.add),
      ),
    );
  }
}
