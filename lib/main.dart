import 'package:fifth_expanded_and_updating_list/01.list_builder_screen_over_flow_solved_with_scroll.dart';
import 'package:fifth_expanded_and_updating_list/04.Important_listview_updating_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContainerWithListViewBuilder(),
    );
  }
}
