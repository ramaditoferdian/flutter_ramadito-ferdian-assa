// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animation/bloc/contact_cubit.dart';
import 'package:flutter_animation/bloc/contact_state.dart';
import 'package:flutter_animation/pages/create_contact_page.dart';
import 'package:flutter_animation/widgets/list_view_contacts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

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
                  // Navigator.of(context).pushNamed('/create-contact-page');

                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                      return CreateContactPage();
                    }, transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                      final tween = Tween(begin: 0.0, end: 1.0);
                      return FadeTransition(
                        opacity: animation.drive(tween),
                        child: child,
                      );
                    }),
                  );
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
