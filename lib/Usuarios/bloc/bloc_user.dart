import 'package:camp/Usuarios/model/Publicacion.dart';
import 'package:camp/Usuarios/repository/FireStore_repository.dart';
import 'package:camp/Usuarios/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as au;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:camp/Usuarios/model/user.dart';
class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();
  final _firestore_repository = FireStoreRepository();
  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<au.User> streamFirebase = au.FirebaseAuth.instance.authStateChanges();
  Stream<au.User> get authStatus => streamFirebase;


  //Casos uso
  //1. SignIn a la aplicación Google
  Future<au.User> signIn() {
    return _auth_repository.signFirebase();
  }

  signOut() { _auth_repository.signOut();  }

  // FIRESTORE

  //  USUARIO
  createUser(User user){ _firestore_repository.createUser(user);  }


  editFotoPerfil(String url){ _firestore_repository.editfoto(url);  }

  //  PUBLICACIONES
  createPublicacion(Publicacion publi){ _firestore_repository.createPub(publi);  }



  @override
  void dispose() {

  }
}
