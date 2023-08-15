import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteItems extends StatefulWidget {
  const MyFavouriteItems({super.key});

  @override
  State<MyFavouriteItems> createState() => _MyFavouriteItemsState();
}

class _MyFavouriteItemsState extends State<MyFavouriteItems> {
  @override
  Widget build(BuildContext context) {
    final favouritelist = Provider.of<Favouriteitem>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourites'),
        backgroundColor: Colors.lime,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouritelist.selecteditem.length,
                itemBuilder: (context, index) {
                  return Consumer<Favouriteitem>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          value.removeitemformyfavouritesscreen(index);
                        },
                        title: Text('i am added to favourite list $index'),
                        trailing: const Icon(Icons.favorite),
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
