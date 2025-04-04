import 'package:cooper_app/features/events/providers/events_providers.dart';
import 'package:cooper_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    EventsProvider eventsState = context.watch<EventsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar evento'),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 25,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nombre del evento',
                  border: OutlineInputBorder(),
                ),
                controller: _nameController,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: 'Capacidad ',
                  border: OutlineInputBorder(),
                  suffixText: ' personas',
                ),
                controller: _capacityController,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  prefixText: '\$ ',
                  hintText: 'Costo del evento',
                  border: OutlineInputBorder(),
                ),
                controller: _costController,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final newEvent = Event(
                      name: _nameController.text,
                      capacity: int.parse(_capacityController.text),
                      cost: double.parse(_costController.text),
                    );

                    eventsState.addEvent(newEvent);
                    _nameController.clear();
                    _capacityController.clear();
                    _costController.clear();
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
