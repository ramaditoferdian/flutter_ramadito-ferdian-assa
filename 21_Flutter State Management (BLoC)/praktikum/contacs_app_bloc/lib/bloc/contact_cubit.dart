import 'package:contacs_app_bloc/bloc/contact_state.dart';
import 'package:contacs_app_bloc/models/contact_model.dart';
import 'package:contacs_app_bloc/services/contact_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  void fetchContacts() async {
    try {
      emit(ContactLoading());

      List<ContactModel> contacts = await ContactService().fetchContacts();
      // List<ContactModel> contacts = listOfKontak;

      await Future.delayed(Duration(seconds: 3));

      emit(ContactSuccess(contacts));
    } catch (e) {
      emit(ContactFailed(e.toString()));
    }
  }

  void addNewContact(ContactModel newContact) async {
    try {
      emit(ContactLoading());

      List<ContactModel> contacts =
          await ContactService().addKontakBaru(newContact);

      emit(ContactSuccess(contacts));
    } catch (e) {
      emit(ContactFailed(e.toString()));
    }
  }
}
