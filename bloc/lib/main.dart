import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'photo_viewer/home_page.dart';
import 'photo_viewer/photo_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Viewer',
      home: BlocProvider(
        create: (context) => PhotoBloc()..add(PhotoEvent.fetch),
        child: HomePage(),
      ),
    );
  }
}
