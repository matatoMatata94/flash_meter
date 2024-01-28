import 'dart:convert';

class FavoriteItem {
  final String title;
  final String number;

  FavoriteItem({required this.title, required this.number});

  String toJsonString() {
    return '{"title": "$title", "number": "$number"}';
  }

  static FavoriteItem fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return FavoriteItem(
      title: json['title'],
      number: json['number'],
    );
  }
}
