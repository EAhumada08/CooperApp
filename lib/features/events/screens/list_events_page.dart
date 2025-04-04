import 'package:cooper_app/features/events/providers/events_providers.dart';
import 'package:cooper_app/features/events/screens/add_event_page.dart';
import 'package:cooper_app/features/events/screens/event_detail_page.dart';
import 'package:cooper_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListEventsPage extends StatelessWidget {
  const ListEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    EventsProvider eventsState = context.watch<EventsProvider>();
    List<Event> events = eventsState.getEvents;

    return Scaffold(
      body:
          events.isEmpty
              ? const Center(
                child: Text(
                  'No hay eventos disponibles',
                  style: TextStyle(fontSize: 20),
                ),
              )
              : ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  final capacity = event.capacity;
                  return Column(
                    children: [
                      ListTile(
                        title: Text(event.name),
                        subtitle: Text('Capacidad: $capacity personas'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => EventDetailPage(event: event),
                            ),
                          );
                        },
                      ),
                      const Divider(height: 0),
                    ],
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEventPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
