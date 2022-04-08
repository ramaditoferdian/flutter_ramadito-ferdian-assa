import 'package:contacs_app_bloc/bloc/contact_cubit.dart';
import 'package:contacs_app_bloc/pages/create_contact_page.dart';
import 'package:contacs_app_bloc/pages/detail_contact_page.dart';
import 'package:contacs_app_bloc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/create-contact-page': (context) => CreateContactPage(),
          // '/detail-contact-page': (context) => DetailContactPage(),
        },
      ),
    );
  }
}
