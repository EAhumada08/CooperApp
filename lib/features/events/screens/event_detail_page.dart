import 'package:cooper_app/features/persons/providers/persons_provider.dart';
import 'package:cooper_app/models/event.dart';
import 'package:cooper_app/models/person.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailPage extends StatefulWidget {
  final Event event;
  const EventDetailPage({super.key, required this.event});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  final Set<int> _selectedIndices = <int>{};

  double get total => _selectedIndices.length * widget.event.cost;

  @override
  Widget build(BuildContext context) {
    PersonsProvider personsState = context.watch<PersonsProvider>();
    List<Person> persons = personsState.persons;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.event.name),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                Person person = persons[index];

                return CheckboxListTile(
                  title: Text(person.name),
                  value: _selectedIndices.contains(index),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedIndices.add(index);
                      } else {
                        _selectedIndices.remove(index);
                      }
                      ;
                    });
                  },
                );
              },
            ),
          ),
          Divider(height: 0, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Total : \$$total pesos'),
          ),
        ],
      ),
    );
  }
}
