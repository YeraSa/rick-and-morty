import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/app_theme_bloc/theme_bloc.dart';
import 'package:rick_and_morty/ui/theme/app_themes.dart';

class PreferencesPage extends StatelessWidget {
  PreferencesPage({Key? key, required this.title}) : super(key: key);

  final String title;

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
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'P R E F E R E N C E S',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Theme.of(context).indicatorColor,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Light mode',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  CustomSwitch(
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  CustomSwitch({
    Key? key,
    required this.context,
  }) : super(key: key);

  BuildContext context;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool val = false;

  void changeTheme(bool value) {
    final bool value = val;
    value
        ? BlocProvider.of<ThemeBloc>(widget.context)
            .add(const ThemeEventChange(theme: AppTheme.LightTheme))
        : BlocProvider.of<ThemeBloc>(widget.context)
            .add(const ThemeEventChange(theme: AppTheme.DarkTheme));
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: val,
        onChanged: (newVal) {
          setState(() {
            val = newVal;
            changeTheme(!val);
          });
        });
  }
}
