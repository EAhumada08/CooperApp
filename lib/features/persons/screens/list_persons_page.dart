import 'package:cooper_app/features/persons/providers/persons_provider.dart';
import 'package:cooper_app/features/persons/screens/add_person_page.dart';
import 'package:cooper_app/models/person.dart';
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
    List<Person> persons = personsState.getPersons;

    return Scaffold(
      body:
          persons.isEmpty
              ? Center(
                child: Text(
                  'No hay personas registradas',
                  style: TextStyle(fontSize: 20),
                ),
              )
              : ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  Person person = persons[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(person.name[0].toUpperCase()),
                      ),
                      title: Text(person.name),
                      subtitle: Text('Edad: ${person.age} años'),
                    ),
                  );
                },
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
