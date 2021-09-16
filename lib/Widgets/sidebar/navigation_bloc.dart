
import 'package:bloc/bloc.dart';

import 'package:camp/Usuarios/UI/Screens/Biblioteca_Screen.dart';
import 'package:camp/Usuarios/UI/Screens/Compras_Online_Screen.dart';
import 'package:camp/Usuarios/UI/Screens/Cuponera_Screen.dart';
import 'package:camp/Usuarios/UI/Screens/Cursos_Screen.dart';
import 'package:camp/Usuarios/UI/Screens/Home_Screen.dart';
import 'package:camp/Usuarios/UI/Screens/Mural_Screen.dart';
import 'package:camp/Usuarios/UI/Screens/Profile_screen.dart';
import 'package:camp/Usuarios/UI/Screens/Quienes_Somos_Screen.dart';
import 'package:camp/Usuarios/UI/Screens/Talleres_Eventos_Screen.dart';
import 'package:camp/Usuarios/UI/Screens/publicaciones_profile.dart';

enum NavigationEvents {
  HomeScreenClickedEvent,
  BibliotecaScreenClickedEvent,
  ComprasOnlineScreenClickedEvent,
  CuponeraScreenClickedEvent,
  MuralScreenClickedEvent,
  ProfileScreenClickedEvent,
  QuienesSomosScreenClickedEvent,
  TalleresEventosScreenClickedEvent,
  CursosScreenClickedEvent,
  PublicacionesProfileScreenClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(HomeScreenView());
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeScreenClickedEvent:
        yield HomeScreenView();
        break;
      case NavigationEvents.ProfileScreenClickedEvent:
        yield ProfileScreenView();
        break;
      case NavigationEvents.MuralScreenClickedEvent:
        yield MuralScreenView();
        break;
      case NavigationEvents.TalleresEventosScreenClickedEvent:
        yield TalleresEventosScreenView();
        break;
      case NavigationEvents.CursosScreenClickedEvent:
        yield CursosScreenView();
        break;
      case NavigationEvents.ComprasOnlineScreenClickedEvent:
        yield ComprasOnlineScreenView();
        break;
      case NavigationEvents.CuponeraScreenClickedEvent:
        yield CuponeraScreenView();
        break;
      case NavigationEvents.BibliotecaScreenClickedEvent:
        yield BibliotecaScreenView();
        break;
      case NavigationEvents.QuienesSomosScreenClickedEvent:
        yield QuienesSomosScreenView();
        break;
      case NavigationEvents.PublicacionesProfileScreenClickedEvent:
        yield PublicacionesProfileEdit();
        break;
    }
  }}