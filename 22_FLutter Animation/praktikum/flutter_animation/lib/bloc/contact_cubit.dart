import 'package:flutter_animation/bloc/contact_state.dart';
import 'package:flutter_animation/models/contact_model.dart';
import 'package:flutter_animation/services/contact_service.dart';
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
