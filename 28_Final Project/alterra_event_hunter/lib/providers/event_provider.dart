// ignore_for_file: prefer_final_fields, avoid_print

import 'package:alterra_event_hunter/models/event_model.dart';
import 'package:alterra_event_hunter/services/api/event_api.dart';
import 'package:alterra_event_hunter/services/event_service.dart';
import 'package:flutter/material.dart';

enum EventState {
  none,
  loading,
  error,
}

class EventProvider with ChangeNotifier {
  // note : Start Code Event State

  EventState _eventState = EventState.none;
  EventState get eventState => _eventState;

  changeState(EventState eventState) {
    _eventState = eventState;
    notifyListeners();
  }

  // note : End Code Event State

  List<EventModel> _events = [];

  List<EventModel> get events => _events;

  set events(List<EventModel> events) {
    _events = events;
    notifyListeners();
  }

  Future<void> getEvents() async {
    try {
      List<EventModel> events = await EventService().fetcEvents();

      _events = events;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> getEventsFromAPI() async {
    changeState(EventState.loading);

    try {
      List<EventModel> events = await EventAPI.getEventFromAPI();

      _events = events;

      changeState(EventState.none);
    } catch (e) {
      print(e);
      changeState(EventState.error);
    }
    notifyListeners();
  }
}
