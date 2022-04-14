// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences_bloc/bloc/contact_cubit.dart';
import 'package:shared_preferences_bloc/bloc/contact_state.dart';
import 'package:shared_preferences_bloc/widgets/list_view_contacts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ContactCubit>().fetchContacts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ContactProvider contactProvider = Provider.of<ContactProvider>(context);

    Widget fab() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //button first

            Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                heroTag: 'btnAdd',
                onPressed: () {
                  Navigator.of(context).pushNamed('/create-contact-page');
                },
                child: Icon(Icons.add),
              ),
            ), // button second

            // Add more buttons here
          ],
        ),
      );
    }

    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        if (state is ContactSuccess) {
          print(state.contacts);
          return Scaffold(
            appBar: AppBar(
              title: Text('Contacts'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      context.read<ContactCubit>().clearContacts();
                    });
                  },
                  icon: Icon(Icons.restart_alt),
                ),
              ],
            ),
            body: Container(
              child: state.contacts.isNotEmpty
                  ? ListViewContacts(state.contacts)
                  : Center(
                      child: SizedBox(
                        height: 100,
                        child: Text('You don\'t have a contact list'),
                      ),
                    ),
            ),
            floatingActionButton: fab(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
