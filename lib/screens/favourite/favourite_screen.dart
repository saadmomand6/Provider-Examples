import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';
import 'my_favourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App Screen'),
        backgroundColor: Colors.lime,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavouriteItems()));
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Consumer<Favouriteitem>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selecteditem.contains(index)) {
                            value.removeitemforfavouritescreen(index);
                          } else {
                            value.additem(index);
                          }
                        },
                        title: Text('Add me to your favourite list $index'),
                        trailing: value.selecteditem.contains(index)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
