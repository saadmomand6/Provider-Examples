import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_and_rest_apis/provider/count_provider.dart';
import 'package:provider_with_mvvm_and_rest_apis/provider/favourite_provider.dart';
import 'package:provider_with_mvvm_and_rest_apis/provider/multiprovider_example.dart';
import 'package:provider_with_mvvm_and_rest_apis/provider/theme_changer_provider.dart';
import 'package:provider_with_mvvm_and_rest_apis/screens/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => MultipleProviderExample()),
        ChangeNotifierProvider(create: (_) => Favouriteitem()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themechanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Provider With MVVM and Rest APIs',
            themeMode: themechanger.thememode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme:
                ThemeData(useMaterial3: true, brightness: Brightness.dark),
            home: const DarkTheme(),
          );
        },
      ),
    );
  }
}
