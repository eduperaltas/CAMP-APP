import 'package:camp/Usuarios/model/contact.dart';
import 'package:camp/Usuarios/model/mensaje.dart';
import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:page_transition/page_transition.dart';

import 'mensajes_profile.dart';

class ContinuaMensaje extends StatefulWidget{
  Mensaje msj;
  @override
  State createState() {
    return _ContinuaMensaje();
  }
  ContinuaMensaje({this.msj});
}
class _ContinuaMensaje extends State<ContinuaMensaje>{

  String _name = "";
  String _busca = 'Buscar...';
  String _mensaje ;
  Contact _contacto;
  @override

  Widget BorradorDialog(Mensaje msj){
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width*0.7,
        height: MediaQuery.of(context).size.height*0.17,
        child: Column(
          children: [
            Text("¿Deseas Guardar este mensaje como borrador?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height*0.028
            ),),
            SizedBox(height: 3,),
            Container(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(context, PageTransition(child: MensajesProfileEdit(), type: PageTransitionType.leftToRight));
                    },
                    child: const Text('No',style: TextStyle(color: Colors.black38),),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0Xff2056a1),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                          print('mensaje: '+msj.mensaje);
                          FirestoreAPI().MensajeBorrador(msj);
                          Navigator.of(context).pop();
                          Navigator.push(context, PageTransition(child: MensajesProfileEdit(), type: PageTransitionType.leftToRight));
                    },
                    child: const Text('Guardar'),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget CargaDialog(String carga){
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width*0.7,
        height: MediaQuery.of(context).size.height*0.3,
        child: Column(
          children: [
            Text(carga=='listo'?"Mensaje Enviado":"Enviando...",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height*0.028
            ),),
            Container(
                padding: const EdgeInsets.fromLTRB(0,20,0,0),
                width: MediaQuery.of(context).size.width*0.2,
                height: MediaQuery.of(context).size.height*0.13,
                child:  carga=='listo'?
                Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor:  Colors.green,
                      child: Icon(Icons.check,size: 70,color: Colors.white,),
                      radius: 70.0,
                    )):CircularProgressIndicator(color: Color(0Xff2056a1) ,strokeWidth: 8,)
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    _contacto=new Contact(uid: this.widget.msj.iddestinatario, name: this.widget.msj.Ndestinatario, foto: this.widget.msj.fotodest);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed:(){
            if(_contacto!=null)
              showDialog(
                context: context,
                builder: (context) => BorradorDialog(new Mensaje(id: this.widget.msj.id,idremitente: uid, iddestinatario: _contacto.uid,fotodest: _contacto.foto,
                    Nremitente: name, Ndestinatario: _contacto.name, mensaje: _mensaje, fotoremit: imageUrl)),
              );
            else
              Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "TU ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*0.03
              ),
            ),
            Text(
              "PERFIL",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: MediaQuery.of(context).size.height*0.03
              ),
            ),
          ],
        ),
        backgroundColor: Color(0Xff2056a1)  ,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Nuevo Mensaje",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0Xff2056a1),
                        fontSize: MediaQuery.of(context).size.height*0.03,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.075,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Contacto",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.02
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.85,
                        height: MediaQuery.of(context).size.height*0.07,
                        // child: buildFloatingSearchBar()
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.075,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Redactar",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*0.02
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.85,
                      height: MediaQuery.of(context).size.height*0.6,
                      //margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.025, top:MediaQuery.of(context).size.height*0.002 ),
                        child: TextFormField(
                          autocorrect: true,
                          initialValue: this.widget.msj.mensaje,
                          // textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: this.widget.msj.mensaje,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.02,
                              //fontFamily:
                            ),
                          ),
                          maxLines: 20,
                          onChanged: (val){
                            setState(() => _mensaje = val);
                          },

                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.07),
                    width: MediaQuery.of(context).size.width*0.95,
                    height: MediaQuery.of(context).size.height*0.5,
                    child: buildFloatingSearchBar()
                ),
              ],
            ),


            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            GestureDetector(
              onTap: (){
                if(_mensaje!=null && _contacto.uid!=null){
                  showDialog(
                    context: context,
                    builder: (context) => CargaDialog('carga'),
                  );
                  Future.delayed(Duration(seconds: 2), () {
                    showDialog(
                      context: context,
                      builder: (context) => CargaDialog('listo'),
                    );
                  });
                  FirestoreAPI().nuevoMensaje(new Mensaje(id: this.widget.msj.id,idremitente: uid, iddestinatario: _contacto.uid,fotodest: _contacto.foto,
                      Nremitente: name, Ndestinatario: _contacto.name, mensaje: _mensaje, fotoremit: imageUrl),true);

                  Future.delayed(Duration(seconds: 3), () {
                    Navigator.push(context, PageTransition(child: MensajesProfileEdit(), type: PageTransitionType.rightToLeft));
                  });

                }
              },
              child: Container(
                //alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular((20.0))),
                      color: (_mensaje!=null && _contacto.uid!=null)?Color(0Xff2056a1):Colors.grey,
                      shape: BoxShape.rectangle
                  ),
                  child: Center(
                    child: Text("ENVIAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height*0.02
                      ),),
                  )
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      hint: this.widget.msj.Ndestinatario,
      automaticallyImplyBackButton: false,
      clearQueryOnClose: true,
      closeOnBackdropTap: true,
      backdropColor: Colors.transparent,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 700),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        print(query);
        setState(() => _name = query);
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],

      builder: (context, transition) {
        return _name!=''?ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            StreamBuilder<QuerySnapshot>(
            stream: (_name != "" && _name != null)
                ? FirebaseFirestore.instance
                .collection('usuarios').doc(uid).collection('contactos')
                .where("caseSearch", arrayContains: _name)
                .snapshots()
                : FirebaseFirestore.instance.collection("usuarios").doc(uid).collection('contactos').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else
              if(snapshot.data.docs.length==0 || !snapshot.hasData) {
                return Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: Text('Busqueda sin resultados'));
              }else {
                print(snapshot.data.docs.length.toString());
                return Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, i) {
                      return StreamBuilder<Object>(
                          stream: FirestoreAPI(vid: snapshot.data.docs[i].id).userData,
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if(!snapshot.hasData){
                              return Container();
                            }
                            User user = snapshot.data;
                            return Contacto(_contacto=new Contact(uid: user.uid,
                                name:  user.name+' '+user.lastname, foto: user.photoURL));
                          }
                      );
                    },
                  ),
                );
              }
            },
          )
              ],
            ),
          ),
        ):Container();
      },
    );
  }

  Widget Contacto(Contact contacto){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            setState(() => _busca = contacto.name);
            setState(() => _name = "");
          },
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.12,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0Xff2056a1) ,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: contacto.foto!=null?NetworkImage(contacto.foto): AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                      ),
                    ),
                  ),
                  radius: MediaQuery.of(context).size.height*0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.07,
                ),
                Text(contacto.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.height*0.02
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Color(0XffC4C3C3),
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.001,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),
      ],
    );
  }
}