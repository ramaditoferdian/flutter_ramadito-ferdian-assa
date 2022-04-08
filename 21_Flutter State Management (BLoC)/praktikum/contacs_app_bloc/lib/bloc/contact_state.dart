import 'package:contacs_app_bloc/models/contact_model.dart';
import 'package:equatable/equatable.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final List<ContactModel> contacts;

  ContactSuccess(this.contacts);

  @override
  List<Object?> get props => [contacts];
}

class ContactAdd extends ContactState {
  final List<ContactModel> contacts;

  ContactAdd(this.contacts);

  @override
  List<Object?> get props => [contacts];
}

class ContactFailed extends ContactState {
  final String error;

  ContactFailed(this.error);

  @override
  List<Object?> get props => [error];
}
