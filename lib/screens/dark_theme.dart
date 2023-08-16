import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    final themechanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Light And Dark Theme'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themechanger.thememode,
              onChanged: themechanger.setTheme,
              title: Text('Light Mode',
                  style: Theme.of(context).textTheme.bodySmall)),
          RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themechanger.thememode,
              onChanged: themechanger.setTheme,
              title: Text('Dark Mode')),
          //   RadioListTile<ThemeMode>(
          //       value: ThemeMode.system,
          //       groupValue: themechanger.thememode,
          //       onChanged: themechanger.setTheme,
          //       title: Text('System Mode'))
        ],
      ),
    );
  }
}
