import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/multiprovider_example.dart';

class MultiProviderExample extends StatefulWidget {
  const MultiProviderExample({super.key});

  @override
  State<MultiProviderExample> createState() => _MultiProviderExampleState();
}

class _MultiProviderExampleState extends State<MultiProviderExample> {
  @override
  Widget build(BuildContext context) {
    final mpe = Provider.of<MultipleProviderExample>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Provider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<MultipleProviderExample>(
            builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.val,
                  onChanged: (newvalue) {
                    value.setvalue(newvalue);
                  });
            },
          ),
          Consumer<MultipleProviderExample>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(value.val)),
                      child: const Center(child: Text('Column 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(value.val)),
                      child: const Center(child: Text('Column 2')),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
