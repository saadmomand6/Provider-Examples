import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  bool switchvalue = false;
  void toggleSwitch(bool value) {
    if (switchvalue == false) {
      setState(() {
        switchvalue = true;
        ThemeMode.dark;
      });
    } else {
      setState(() {
        switchvalue = false;
        ThemeMode.light;
      });
    }
  }

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
          Switch(
            value: themechanger.thememode == ThemeMode.dark,
            onChanged: themechanger.switchsetTheme,
            activeColor: const Color.fromARGB(255, 197, 155, 206),
            activeTrackColor: const Color(0xff5E5E5E),
            inactiveThumbColor: const Color.fromARGB(255, 113, 77, 121),
            inactiveTrackColor: const Color(0xff5E5E5E),
          ),
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
