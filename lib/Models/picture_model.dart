import 'dart:typed_data';

class Picture {
 late final int id;
 late final String title;
  late final Uint8List picture;

  Picture(this.id, this.title, this.picture);

  Picture.fromMap(Map map) {
    id = map[id];
    title = map[title];
    picture = map[picture];
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "picture" : picture,
  };
}