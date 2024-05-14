import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'photo_model.dart';

// Event untuk mengambil gambar
enum PhotoEvent { fetch }

// Bloc untuk mengelola gambar
class PhotoBloc extends Bloc<PhotoEvent, List<Photo>> {
  PhotoBloc() : super([]);

  @override
  Stream<List<Photo>> mapEventToState(PhotoEvent event) async* {
    if (event == PhotoEvent.fetch) {
      yield await fetchPhotos();
    }
  }

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}

