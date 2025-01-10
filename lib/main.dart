import 'package:fifth_expanded_and_updating_list/05.same_program_listview_updating_list_using_function.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListviewUpdatingListWithUpdateFunction(),
    );
  }
}
