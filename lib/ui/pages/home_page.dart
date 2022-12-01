import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character_bloc.dart';
import 'package:rick_and_morty/data/repositories/character_repo.dart';
import 'package:rick_and_morty/ui/pages/preferences_page.dart';

import 'search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final repository = CharacterRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).indicatorColor,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PreferencesPage(title: title)));
            },
          )),
      body: BlocProvider(
        create: (context) => CharacterBloc(characterRepo: repository),
        child: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: const SearchPage(),
        ),
      ),
    );
  }
}
