import 'package:cooper_app/features/persons/providers/persons_provider.dart';
import 'package:cooper_app/models/person.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PersonsProvider personsState = context.watch<PersonsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar persona'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            Column(
              spacing: 20,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                      border: OutlineInputBorder(),
                    ),
                    controller: _nameController,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Edad',
                      border: OutlineInputBorder(),
                    ),
                    controller: _edadController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                ElevatedButton(
                  onPressed: () {
                    Person newPerson = Person(
                      name: _nameController.text,
                      age: int.parse(_edadController.text),
                    );

                    personsState.addPerson(newPerson);

                    _nameController.clear();
                    _edadController.clear();
                  },
                  child: Text('Agregar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
