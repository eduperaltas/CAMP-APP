import 'package:flutter/material.dart';

class User {
  final String uid;
  final String name;
  final String lastname;
  final String email;
  String photoURL;
  final String estado;
  final String tipCuenta;
  String empresa;
  String cargo;
  String correo;
  String telefono;
  String correoCorp;
  String Resumen;
  String Experiencia;
  //myFavoritePlaces
  //myPlaces
  User({
   Key Key,
   @required this.uid,
   @required this.name,
   @required this.lastname,
   @required this.email,
   @required this.photoURL,
   @required this.estado,
   @required this.tipCuenta,
    this.empresa,
    this.cargo,
    this.correo,
    this.telefono,
    this.correoCorp,
    this.Resumen,
    this.Experiencia,
   });
}
