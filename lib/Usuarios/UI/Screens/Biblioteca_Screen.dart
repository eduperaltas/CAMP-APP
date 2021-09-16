import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:flutter/material.dart';
class BibliotecaScreenView extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _BibliotecaScreenView();
  }
}
class _BibliotecaScreenView extends State<BibliotecaScreenView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),

    );
  }}