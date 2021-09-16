import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:camp/Widgets/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';


class SideBar extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideBarLayout(),
    );
  }
}