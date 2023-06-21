import 'dart:convert';

class User {
  final String imagePath;
  final String name;
  final String city;
  final String about;
  final String major;

  const User({
    required this.imagePath,
    required this.name,
    required this.city,
    required this.about,
    required this.major
  });
}
