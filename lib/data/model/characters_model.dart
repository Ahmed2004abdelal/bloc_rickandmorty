// import 'package:flutter/foundation.dart';

// class CharactersModel {
//   final int id;
//   final String name;
//   final String species;
//   final String gender;
//   final String image;
//   final List<String> episode;
//   final Place origin;
//   final Place location;

//   CharactersModel({
//     required this.id,
//     required this.name,
//     required this.species,
//     required this.gender,
//     required this.image,
//     required this.episode,
//     required this.origin,
//     required this.location,
//   });

//   factory CharactersModel.fromJson(Map<String, dynamic> json) {
//     return CharactersModel(
//       id: json['id'] ?? "0",
//       name: json['name'] ?? "0",
//       species: json['species'] ?? "0",
//       gender: json['gender'] ?? "0",
//       image: json['image'] ?? "0",
//       episode: json['episode'] ?? [],
//       origin: json['origin'] ?? "0",
//       location: json['location'] ?? "0",
//     );
//   }
// }

// class Place {
//   final String name;
//   final String url;

//   Place({required this.name, required this.url});

//   factory Place.fromJson(Map<String, dynamic> json) {
//     return Place(name: json['name'] ?? "Unknown", url: json['url'] ?? "");
//   }
// }

class CharactersModel {
  final int id;
  final String name;
  final String species;
  final String gender;
  final String status;
  final String image;
  final List<String> episode;
  final Place origin;
  final Place location;

  CharactersModel({
    required this.id,
    required this.status,
    required this.name,
    required this.species,
    required this.gender,
    required this.image,
    required this.episode,
    required this.origin,
    required this.location,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'] ?? '',
      episode: List<String>.from(json['episode'] ?? []),
      origin: Place.fromJson(json['origin'] ?? {}),
      location: Place.fromJson(json['location'] ?? {}),
    );
  }
}

class Place {
  final String name;
  final String url;

  Place({required this.name, required this.url});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(name: json['name'] ?? 'Unknown', url: json['url'] ?? '');
  }
}
