import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<FavoriteItem> favorites;
  final Function(FavoriteItem) onFavoriteSelected;
  final Function(FavoriteItem) onDeleteFavorite;

  FavoritesPage({
    required this.favorites,
    required this.onFavoriteSelected,
    required this.onDeleteFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoriten'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(favorites[index].number),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              onDeleteFavorite(favorites[index]);
            },
            direction: DismissDirection.endToStart,
            child: ListTile(
              title: Text(favorites[index].title),
              subtitle: Text('Nummer: ${favorites[index].number}'),
              onTap: () {
                onFavoriteSelected(favorites[index]);
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}

class FavoriteTile extends StatelessWidget {
  final FavoriteItem favorite;
  final VoidCallback onTap;

  FavoriteTile({required this.favorite, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(favorite.title),
      subtitle: Text('Nummer: ${favorite.number}'),
      onTap: onTap,
    );
  }
}

class FavoriteItem {
  final String title;
  final String number;

  FavoriteItem({required this.title, required this.number});
}
