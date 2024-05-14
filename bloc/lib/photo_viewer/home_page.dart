import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc package
import 'package:flutter_application_1/photo_viewer/photo_bloc.dart';
import 'package:flutter_application_1/photo_viewer/photo_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Viewer'),
      ),
      body: BlocBuilder<PhotoBloc, List<Photo>>(
        builder: (context, photoList) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: photoList.length,
            itemBuilder: (context, index) {
              return Image.network(
                photoList[index].url,
                fit: BoxFit.cover,
              );
            },
          );
        },
      ),
    );
  }
}
