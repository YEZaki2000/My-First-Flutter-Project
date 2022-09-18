/////////////////////////////////////////////////////////////////////////////

// And now the same thing but using a factory method (i.e, without creating any instances).

import 'dart:collection';
import 'dart:convert';

class Photo {
  late String name;
  late int age;
  late String imagePath;

  Photo({required this.name, required this.age, required this.imagePath});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      name: json['name'],
      age: json['age'],
      imagePath: json['imagePath'],
    );
  }
}

// void main() {
String _rawJson = '''[
      {"name":"Mary","age":30, "imagePath": "flutter_application_1/assets/images/code.png"}, 
      {"name":"Josh","age":25, "imagePath": "flutter_application_1/assets/images/code2.png"}
      ]''';
final _personMap = jsonDecode(_rawJson).cast<Map<String, dynamic>>();
//   print(personMap);
ListQueue<Photo> _photoSet =
    ListQueue.from(_personMap.map<Photo>((json) => Photo.fromJson(json)));

ListQueue<Photo> get photoSet => _photoSet;

  // print(photoSet);
// }
