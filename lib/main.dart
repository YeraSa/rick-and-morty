import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/bloc_observable.dart';

import 'ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());

  HydratedBloc.storage = storage;
  Bloc.observer = CharacterBlocObservable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(210, 211, 219, 0.8),
        ),
        backgroundColor:const  Color.fromRGBO(228, 229, 241, 0),
        cardColor: const Color.fromRGBO(210, 211, 219, 0.8),
        indicatorColor: const Color.fromRGBO(72, 75, 106, 1),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromRGBO(72, 75, 106, 1)),
          headline2: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Color.fromRGBO(72, 75, 106, 1)),
          headline3: TextStyle(fontSize: 24, color: Color.fromRGBO(72, 75, 106, 1)),
          bodyText1: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w200, color: Color.fromRGBO(72, 75, 106, 1)),
          bodyText2: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(72, 75, 106, 1)),
          caption: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w100, color: Color.fromRGBO(72, 75, 106, 1)),
        ),
      ),
      home: HomePage(title: 'Rick and Morty'),
    );
  }
}
