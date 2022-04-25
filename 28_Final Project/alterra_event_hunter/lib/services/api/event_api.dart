import 'package:alterra_event_hunter/models/event_model.dart';
import 'package:dio/dio.dart';

class EventAPI {
  static Future<List<EventModel>> getEventFromAPI() async {
    Response<List<dynamic>> response = await Dio()
        .get('https://623b054b46a692bd844cfc0f.mockapi.io/api/events');

    if (response.statusCode == 200) {
      List<EventModel> contacts = response.data!.map((e) {
        return EventModel.fromJson(e);
      }).toList();
      return contacts;
    }

    throw Exception();
  }
}
