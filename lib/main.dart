import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_and_rest_apis/provider/count_provider.dart';
import 'package:provider_with_mvvm_and_rest_apis/provider/favourite_provider.dart';
import 'package:provider_with_mvvm_and_rest_apis/provider/multiprovider_example.dart';
import 'package:provider_with_mvvm_and_rest_apis/screens/favourite/favourite_screen.dart';

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
      ],
      child: MaterialApp(
        title: 'Provider With MVVM and Rest APIs',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FavouriteScreen(),
      ),
    );
  }
}
