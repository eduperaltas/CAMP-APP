import 'package:camp/Usuarios/model/Calendario.dart';
import 'package:camp/Usuarios/model/Cupon.dart';
import 'package:camp/Usuarios/model/Curso.dart';
import 'package:camp/Usuarios/model/Evento.dart';
import 'package:camp/Usuarios/model/Profesional.dart';
import 'package:camp/Usuarios/model/Publicacion.dart';
import 'package:camp/Usuarios/model/mensaje.dart';
import 'package:camp/Usuarios/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'firebase_auth_api.dart';

class FirestoreAPI {
  final String USERS = 'usuarios';
  final String PROFESIONAL = 'profesional';
  final String MURAL = 'mural';
  final String EVENTOS = 'eventos';
  final String CURSOS = 'cursos';
  final String ANUNCIOS = 'anuncios';
  final String CUPONES = 'cupones';
  final FirebaseFirestore  _db = FirebaseFirestore.instance;
  String vid;
  String TipMensaje;
  String accion;
  String fecha;
  int Searchsize;
  int search=0;
  String filtro;
  String Txtabuscar;
  String PredFotoPerfil='https://firebasestorage.googleapis.com/v0/b/campproyect-69a08.appspot.com/o/Predeterminadas%2FIMG_Usuario_Predeterminado.png?alt=media&token=5aa86954-61cb-4b92-93a0-6de56f3389b5';
  FirestoreAPI({this.vid,this.TipMensaje,this.accion,this.fecha,this.Searchsize,this.search,this.Txtabuscar,this.filtro});

  // String uid;
  // FirestoreAPI({ this.uid});
  // PARAMETROS DE BUSQUEDA
  setSearchParam(String caseNumber) {
    List<String> caseSearchList = List();
    String temp = "";
    for(int i = 0; i < caseNumber.length; i++){
      temp = temp + caseNumber[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }
  //****************************************************  USER  ****************************************************
  // Set USER
  void createUserData(User user) async{
    DocumentReference ref= _db.collection(USERS).doc(user.uid);
    String search =user.lastname!=null?user.name+' '+user.lastname:user.name;
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'lastname': user.lastname,
      'email' : user.email,
      'photoUrl': user.photoURL!=null?user.photoURL:PredFotoPerfil,
      'Creacion': DateTime.now(),
      'Estado': 'Activo',
      'Tipo de cuenta':'Gratuita',
      "caseSearch" : setSearchParam(search),

      'empresa': '',
      'cargo':'',
      'telefono': user.telefono!=null?user.telefono: '',
      'corp email' : '',
      'resumen': '',
      'experiencia':'',
    });

  }

  // Get USER
  User userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uid: snapshot.data()['uid'],
      name: snapshot.data()['name'],
      lastname: snapshot.data()['lastname']!=null?snapshot.data()['lastname']:"",
      email: snapshot.data()['email'],
      photoURL: snapshot.data()['photoUrl'],
      estado: snapshot.data()['Estado'],
      tipCuenta: snapshot.data()['Tipo de cuenta'],

      empresa: snapshot.data()['empresa']!=null?snapshot.data()['empresa']:'',
      cargo: snapshot.data()['cargo']!=null?snapshot.data()['cargo']:'',
      telefono: snapshot.data()['telefono']!=null?snapshot.data()['telefono']:"",
      correoCorp: snapshot.data()['corp email']!=null?snapshot.data()['corp email']:"",
      Resumen: snapshot.data()['resumen']!=null?snapshot.data()['resumen']:"",
      Experiencia: snapshot.data()['experiencia']!=null?snapshot.data()['experiencia']:"",
    );
  }

  Stream<User> get userData {
    return _db.collection(USERS).doc(vid!=null?vid:uid)
        .snapshots().map(userDataFromSnapshot);
  }

  // Update PROFESIONAL
  void createProfesionalData(User prof) async{
    DocumentReference ref= _db.collection(USERS).doc(uid);
    return ref.set({
      'empresa': prof.empresa,
      'cargo': prof.cargo,
      'telefono': prof.telefono,
      'corp email' : prof.correoCorp,
      'resumen': prof.Resumen,
      'experiencia': prof.Experiencia,
    }, SetOptions(merge : true));
  }

  // Update USER
  void editProfilePhoto(String url) async{
    DocumentReference ref= _db.collection(USERS).doc(uid);
    return await ref.update({'photoUrl': url,});
  }

//****************************************************  PUBLICACION  ****************************************************
// Set PUBLICACION

  void createPublicacion(Publicacion pub) async{
    String docnom='Pub'+uid+DateTime.now().day.toString()+DateTime.now().month.toString()
        +DateTime.now().year.toString()+DateTime.now().hour.toString()+DateTime.now().minute.toString();

    DocumentReference ref= _db.collection(MURAL).doc(docnom);

    String fecha=DateFormat('dd/MM/yyyy kk:mm').format(DateTime.now());

    DocumentReference userRef= _db.collection(USERS).doc(uid).collection('publicaciones').doc(docnom);

    userRef.set({
      'Titulo': pub.titulo,
      'Estado': pub.estado,
      'Fecha': DateTime.now(),
    });
    return ref.set({
      'userid': pub.uid,
      'autor': pub.Autorname,
      'fotoAutor': pub.Autorfoto,
      'Titulo': pub.titulo,
      'Texto': pub.texto,
      'Portada' : pub.portada,
      if(pub.img1!=null)'Img1': pub.img1 else 'Img1':'',
      if(pub.img2!=null)'Img2': pub.img2 else 'Img2':'',
      'Fecha': fecha,
      'Estado': pub.estado,
      "caseSearch" : setSearchParam(pub.titulo),
    });
  }

  // Get PUBLICACION
    //en perfil
  List<Publicacion> _publicacionPerfinDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Publicacion(
        titulo: doc['Titulo'],
        estado: doc['Estado']
      );
    }).toList();
  }

  Stream<List<Publicacion>> get publicacionesPerfilData {
    return _db.collection(USERS).doc(uid).collection('publicaciones').snapshots()
        .map(_publicacionPerfinDataFromSnapshot);
  }

    //en mural
  List<Publicacion> _publicacionesDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Publicacion(
          titulo: doc['Titulo'],
          estado: doc['Estado'],
          Autorfoto:  doc['fotoAutor'],
          Autorname: doc['autor'],
          texto: doc['Texto'],
          img1: doc['Img1'],
          img2: doc['Img2'],
          portada: doc['Portada'],
          fecha: doc['Fecha'].toString(),
      );
    }).toList();
  }

  Stream<List<Publicacion>> get publicacionesData {
    return _db.collection(MURAL).where('Estado',isEqualTo: 'Aprobado').snapshots()
        .map(_publicacionesDataFromSnapshot);
  }

//****************************************************  CONTACTOS  ****************************************************
// Set CONTACT
  void createContactData(String name, String foto, String cid) async{
    DocumentReference ref= _db.collection(USERS).doc(uid).collection('contactos').doc(cid);
    return ref.set({
      'name': name,
      'photoUrl': foto,
      "caseSearch" : setSearchParam(name),
    });
  }

//****************************************************  MENSAJES  ****************************************************
// Nuevo Mensaje
  void nuevoMensaje(Mensaje msj, bool borrador) async{

    DocumentReference refborrador= _db.collection(USERS).doc(uid).collection('mensajes').doc('msj')
        .collection('borrador').doc(msj.id);
    if(borrador){
      refborrador.delete();
    }

    String dateTime=DateFormat('dd/MM/yyyy kk:mm').format(DateTime.now());;

    String nameMsj= 'F'+msj.idremitente.substring(1,4)+
        DateTime.now().day.toString() +DateTime.now().month.toString()+DateTime.now().year.toString()
        +DateTime.now().hour.toString()+DateTime.now().minute.toString()+DateTime.now().second.toString()+
        'T'+msj.iddestinatario.substring(1,4);

    DocumentReference refemisor= _db.collection(USERS).doc(msj.idremitente).collection('mensajes').doc('msj')
        .collection('enviados').doc(nameMsj);
    refemisor.set({
      'idremitente': msj.idremitente,
      'iddestinatario': msj.iddestinatario,
      'Nremitente': msj.Nremitente,
      'Ndestinatario': msj.Ndestinatario,
      'fotoremit': msj.fotoremit,
      'fotodest': msj.fotodest,
      'mensaje': msj.mensaje,
      'fecha': dateTime,
      "caseSearch" : setSearchParam(msj.Ndestinatario),
    });

    DocumentReference refdestino= _db.collection(USERS).doc(msj.iddestinatario).collection('mensajes').doc('msj')
        .collection('entrada').doc(nameMsj);
    return refdestino.set({
      'leido':false,
      'idremitente': msj.idremitente,
      'iddestinatario': msj.iddestinatario,
      'Nremitente': msj.Nremitente,
      'Ndestinatario': msj.Ndestinatario,
      'fotoremit': msj.fotoremit,
      'fotodest': msj.fotodest,
      'mensaje': msj.mensaje,
      'fecha': dateTime,
      "caseSearch" : setSearchParam(msj.Nremitente),

    });

  }

// Visto
  void vistoMensaje(Mensaje msj) async{
    DocumentReference refvisto= _db.collection(USERS).doc(uid).collection('mensajes').doc('msj')
        .collection(TipMensaje).doc(msj.id);
    refvisto.update({'leido': true });

  }
// Eliminar Mensaje
  void eliminaMensaje(Mensaje msj,String seccion) async{
    DocumentReference refeliminados= _db.collection(USERS).doc(uid).collection('mensajes').doc('msj')
        .collection('papelera').doc(msj.id);

     if(seccion=='papelera'){
       if(accion=='recuperar'){
         DocumentReference refrecup= _db.collection(USERS).doc(uid).collection('mensajes').doc('msj')
             .collection(msj.SecAnterior).doc(msj.id);
         refrecup.set({
           'de': seccion,
           'idremitente': msj.idremitente,
           'iddestinatario': msj.iddestinatario,
           'Nremitente': msj.Nremitente,
           'Ndestinatario': msj.Ndestinatario,
           'fotoremit': msj.fotoremit,
           'fotodest': msj.fotodest,
           'mensaje': msj.mensaje,
           'fecha': msj.date,
           "caseSearch" : setSearchParam(msj.Ndestinatario),
           'leido': true
         });
       }
       refeliminados.delete();
     }
     else{
       refeliminados.set({
         'de': seccion,
         'idremitente': msj.idremitente,
         'iddestinatario': msj.iddestinatario,
         'Nremitente': msj.Nremitente,
         'Ndestinatario': msj.Ndestinatario,
         'fotoremit': msj.fotoremit,
         'fotodest': msj.fotodest,
         'mensaje': msj.mensaje,
         'fecha': msj.date,
         "caseSearch" : setSearchParam(msj.Ndestinatario),
       });

       DocumentReference refemisor= _db.collection(USERS).doc(uid).collection('mensajes').doc('msj')
           .collection(TipMensaje).doc(msj.id);
       return refemisor.delete();
     }

  }
// Mandar a borrador
  void MensajeBorrador(Mensaje msj) async{
    String dateTime=DateFormat('dd/MM/yyyy kk:mm').format(DateTime.now());
    print('idborrador: '+msj.id);
    DocumentReference refemisor= _db.collection(USERS).doc(uid).collection('mensajes').doc('msj')
        .collection('borrador').doc(msj.id);
    refemisor.set({
      'idremitente': msj.idremitente,
      'iddestinatario': msj.iddestinatario,
      'Nremitente': msj.Nremitente,
      'Ndestinatario': msj.Ndestinatario,
      'fotoremit': msj.fotoremit,
      'fotodest': msj.fotodest,
      'mensaje': msj.mensaje,
      'fecha': dateTime,
      "caseSearch" : setSearchParam(msj.Ndestinatario),
    });
  }

// GET Enviados
  //LEIDO HABRA PROBLEMA AL LEER SIN EL DATO LEIDO?
  List<Mensaje> _MensajeDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Mensaje(
          id: doc.id,
          fotodest: doc['fotodest'],
          fotoremit: doc['fotoremit'],
          iddestinatario: doc['iddestinatario'],
          idremitente: doc['idremitente'],
          mensaje: doc['mensaje'],
          Ndestinatario: doc['Ndestinatario'],
          Nremitente: doc['Nremitente'],
          date: doc['fecha'],
          leido: TipMensaje=='entrada'? doc['leido']:null,
          SecAnterior: TipMensaje=='papelera'? doc['de']:null
      );
    }).toList();
  }

  Stream<List<Mensaje>> get MensajesData {
    return _db.collection(USERS).doc(uid).collection('mensajes').doc('msj')
        .collection(TipMensaje).snapshots()
        .map(_MensajeDataFromSnapshot);
  }

//****************************************************  EVENTOS  ****************************************************
// Set EVENTO
  void createEventData(Evento e) async{
    DocumentReference ref= _db.collection(EVENTOS).doc(e.id);
    return ref.set({
      'autorID':e.Autorid,
      'estado':e.estado,
      'fecha': e.fecha,
      'titulo': e.titulo,
      'link': e.link,
      'portada': e.portada,
      'texto': e.texto,
      'img1': e.img1,
      'img2': e.img2,
      "caseSearch" : setSearchParam(e.titulo),
    });
  }
//GET EVENTOS
  List<Evento> _eventossDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Evento(
          id: doc.id,
          Autorid: doc['autorID'],
          estado: doc['estado'],
          link: doc['link'],
          fecha: doc['fecha'],
          texto: doc['texto'],
          titulo: doc['titulo'],
          img1: doc['img1'],
          img2: doc['img2'],
          portada: doc['portada'],
        );
    }).toList();
  }

  Stream<List<Evento>> get eventossData {
    // DateTime date =DateTime.now();
    // print(date.toString());
    if(search==1)
      return _db.collection(EVENTOS).where('estado',isEqualTo: 'Activo').where("caseSearch", arrayContains: Txtabuscar).snapshots()
          .map(_eventossDataFromSnapshot);
    else
      return _db.collection(EVENTOS).where('estado',isEqualTo: 'Activo').snapshots()
          .map(_eventossDataFromSnapshot);
  }

  // Get Evento
  Evento eventorDataFromSnapshot(DocumentSnapshot snapshot) {
    return Evento(
      id: snapshot.id,
      Autorid: snapshot.data()['autorID'],
      estado: snapshot.data()['estado'],
      link: snapshot.data()['link'],
      fecha: snapshot.data()['fecha'],
      texto: snapshot.data()['texto'],
      titulo: snapshot.data()['titulo'],
      img1: snapshot.data()['img1'],
      img2: snapshot.data()['img2'],
      portada: snapshot.data()['portada'],
    );
  }

  Stream<Evento> get eventoData {
    return _db.collection(EVENTOS).doc(vid)
        .snapshots().map(eventorDataFromSnapshot);
  }

//****************************************************  CALENDARIO  ****************************************************
// Set CALENDARIO
  void createCalendarioData(String tit,String date,String id) async{
    DocumentReference ref= _db.collection(USERS).doc(uid).collection('calendario').doc(id);
    return ref.set({
      'titulo': tit,
      'fecha': date.substring(0,10),
      'hora': date.substring(12),
    });
  }

  List<Calendario> _calendarioDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Calendario(
        id: doc.id,
        fecha: doc['fecha'],
        Hora:  doc['hora'],
        titulo: doc['titulo'],
      );
    }).toList();
  }

  Stream<List<Calendario>> get calendarioData {
    return _db.collection(USERS).doc(uid).collection('calendario').where('fecha',isEqualTo: fecha).snapshots()
        .map(_calendarioDataFromSnapshot);
  }

  //****************************************************  CURSOS  ****************************************************
// Set CURSO
  List<Curso> _cursosDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Curso(
        id: doc.id,
        poniente:doc['poniente'],
        imgponiente:doc['imgponiente'],
        Autorid: doc['autorID'],
        estado: doc['estado'],
        link: doc['link'],
        fecha: doc['fecha'],
        texto: doc['texto'],
        titulo: doc['titulo'],
        img1: doc['Img1'],
        img2: doc['Img2'],
        img3: doc['Img3'],
        portada: doc['portada'],
      );
    }).toList();
  }

  Stream<List<Curso>> get cursossData {
    if(Searchsize!=null)
      return _db.collection(CURSOS).where('estado',isEqualTo: 'Activo').limit(Searchsize).snapshots()
          .map(_cursosDataFromSnapshot);
    else
      return _db.collection(CURSOS).where('estado',isEqualTo: 'Activo').snapshots()
          .map(_cursosDataFromSnapshot);
  }

//****************************************************  CUPON  ****************************************************

  //GET CUPON
  List<Cupon> _cuponesDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Cupon(
        id: doc.id,
        Autorid: doc['autorID'],
        estado: doc['estado'],
        fechaini: doc['fechaIni'],
        fechafin: doc['fechaFin'],
        texto: doc['texto'],
        titulo: doc['titulo'],
        portada: doc['portada'],
        direccion: doc['direccion'],
        urldirec: doc['urldirec'],
        categoria: doc['categoria'],
        descarga: doc['descarga'],
      );
    }).toList();
  }

  Stream<List<Cupon>> get cuponesData {
    if(filtro!=null)
      return _db.collection(CUPONES).where('estado',isEqualTo: 'Activo').where("categoria", isEqualTo: filtro).snapshots()
        .map(_cuponesDataFromSnapshot);
    else
      if(search==1)
        return _db.collection(CUPONES).where('estado',isEqualTo: 'Activo').where("caseSearch", arrayContains: Txtabuscar).snapshots()
            .map(_cuponesDataFromSnapshot);
      else
        return _db.collection(CUPONES).where('estado',isEqualTo: 'Activo').snapshots()
            .map(_cuponesDataFromSnapshot);

  }

  // //****************************************************  PROFESIONAL  ****************************************************
  // // Set PROFESIONAL
  // void createProfesionalData(Profesional prof) async{
  //   DocumentReference ref= _db.collection(USERS).doc(uid).collection(PROFESIONAL).doc('perfil');
  //   return ref.set({
  //     'empresa': prof.empresa,
  //     'cargo': prof.cargo,
  //     'telefono': prof.telefono,
  //     'corp email' : prof.correoCorp,
  //     'resumen': prof.Resumen,
  //     'experiencia': prof.Experiencia,
  //   }, SetOptions(merge : true));
  // }
  //
  // // Get PROFESIONAL
  // Profesional ProfesionalDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return Profesional(
  //     empresa: snapshot.data()['empresa']!=null?snapshot.data()['empresa']:'',
  //     cargo: snapshot.data()['cargo']!=null?snapshot.data()['cargo']:'',
  //     telefono: snapshot.data()['telefono']!=null?snapshot.data()['telefono']:"",
  //     correoCorp: snapshot.data()['corp email']!=null?snapshot.data()['corp email']:"",
  //     Resumen: snapshot.data()['resumen']!=null?snapshot.data()['resumen']:"",
  //     Experiencia: snapshot.data()['experiencia']!=null?snapshot.data()['experiencia']:"",
  //   );
  // }
  //
  // Stream<Profesional> get ProfesionalData {
  //   return _db.collection(USERS).doc(vid!=null?vid:uid).collection(PROFESIONAL).doc('perfil')
  //       .snapshots().map(ProfesionalDataFromSnapshot);
  // }

}

