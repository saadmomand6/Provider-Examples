import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_and_rest_apis/provider/count_provider.dart';

class CountExapmle extends StatefulWidget {
  const CountExapmle({super.key});

  @override
  State<CountExapmle> createState() => _CountExapmleState();
}

class _CountExapmleState extends State<CountExapmle> {
  // @override
  // void initState() {
  //   super.initState();
  //   final cp = Provider.of<CountProvider>(context, listen: false);
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     cp.setcount();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final cp = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: Consumer<CountProvider>(
            builder: (context, value, child) {
              return Text(
                'Count Example',
                style: TextStyle(color: value.bgcolor),
              );
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.black),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cp.setcount();
          cp.setbgcolor();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
