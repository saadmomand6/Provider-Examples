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
              brightness: Brightness.dark,
              primaryColor: Colors.red[800],
              fontFamily: 'Inter',
              textTheme: TextTheme(
                headlineLarge: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height * 0.024),
                headlineMedium: TextStyle(
                    color: const Color(0xffFFEEA8),
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    fontWeight: FontWeight.w400),
                bodySmall: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.016),
                labelLarge: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height * 0.020),
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              textTheme: TextTheme(
                headlineLarge: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height * 0.024),
                headlineMedium: TextStyle(
                    color: const Color(0xffFFEEA8),
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    fontWeight: FontWeight.w400),
                bodySmall: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * 0.032),
                labelLarge: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height * 0.020),
              ),
            ),
            home: const DarkTheme(),
          );
        },
      ),
    );
  }
}
