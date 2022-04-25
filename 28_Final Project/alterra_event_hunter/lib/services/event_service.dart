import 'package:alterra_event_hunter/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  CollectionReference _eventReference =
      FirebaseFirestore.instance.collection('events');

  Future<List<EventModel>> fetcEvents() async {
    try {
      QuerySnapshot result = await _eventReference.get();

      List<EventModel> destinations = result.docs.map(
        (e) {
          return EventModel.fromJson(e.data() as Map);
        },
      ).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
