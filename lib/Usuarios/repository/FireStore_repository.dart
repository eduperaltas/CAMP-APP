

import 'package:camp/Usuarios/model/Publicacion.dart';
import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';

class FireStoreRepository {
  final _firestoreAPI = FirestoreAPI();

  createUser(User user) => _firestoreAPI.createUserData(user);
  editfoto(String url) => _firestoreAPI.editProfilePhoto(url);
  createPub(Publicacion pub) => _firestoreAPI.createPublicacion(pub);



}
