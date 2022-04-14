import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_bloc/bloc/contact_state.dart';
import 'package:shared_preferences_bloc/models/contact_model.dart';
import 'package:shared_preferences_bloc/services/contact_service.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  void fetchContacts() async {
    try {
      emit(ContactLoading());

      await ContactService().loadData();

      List<ContactModel> contacts = await ContactService().fetchContacts();
      // List<ContactModel> contacts = listOfKontak;

      // await Future.delayed(Duration(seconds: 3));

      emit(ContactSuccess(contacts));
    } catch (e) {
      emit(ContactFailed(e.toString()));
    }
  }

  void clearContacts() async {
    try {
      emit(ContactLoading());

      await ContactService().clearData();

      List<ContactModel> contacts = await ContactService().fetchContacts();
      // List<ContactModel> contacts = listOfKontak;

      // await Future.delayed(Duration(seconds: 3));

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
