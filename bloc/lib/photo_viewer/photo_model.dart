// Model untuk gambar
class Photo {
  final String id;
  final String author;
  final String url;

  Photo({required this.id, required this.author, required this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      author: json['author'],
      url: json['download_url'],
    );
  }
}
