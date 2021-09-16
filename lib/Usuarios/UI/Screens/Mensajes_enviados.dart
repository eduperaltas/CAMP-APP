import 'package:camp/Usuarios/model/mensaje.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Lista_contactos_profile_detail.dart';
import 'mensaje_buzon_detalle.dart';

class MensajesEnviados extends StatefulWidget{
  @override
  State createState() {
    return _MensajesEnviados();
  }
}
class _MensajesEnviados extends State<MensajesEnviados>{
  @override
  String _Msjbuscar="";
  String _Seccion='enviados';
  Widget correo(Mensaje msj){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, PageTransition(child: Mensajes_buzon_detail(msj: msj,), type: PageTransitionType.rightToLeft));
          },
          child: Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.12,
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0Xff2056a1),
                        width:MediaQuery.of(context).size.height*0.001,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(msj.fotodest)
                      ),
                    ),
                  ),
                  radius: MediaQuery.of(context).size.height*0.04,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.035,
                      child: Text(msj.Ndestinatario,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: MediaQuery.of(context).size.height*0.02
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.45,
                      height: MediaQuery.of(context).size.height*0.045,
                      child: Text(msj.mensaje,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.height*0.015
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.025,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.17,
                      height: MediaQuery.of(context).size.height*0.08,
                      child: Text(msj.date,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.height*0.013
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Color(0XffC4C3C3),
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.002,
        ),
      ],
    );
  }

  Widget BuscaMsj(){
    return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance
          .collection('usuarios').doc(uid).collection('mensajes').doc('msj')
          .collection(_Seccion).where("caseSearch", arrayContains: _Msjbuscar)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else
        if(snapshot.data.docs.length==0) {
          return Container(
              alignment: Alignment.center,
              height: 300,
              child: Text('Busqueda sin resultados'));
        }else {
          return Container(
            // color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.48,
            child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i){
                  return correo(new Mensaje(
                      idremitente: snapshot.data.docs[i].data()['idremitente'], iddestinatario: snapshot.data.docs[i].data()['iddestinatario'],
                      Nremitente: snapshot.data.docs[i].data()['Nremitente'], Ndestinatario: snapshot.data.docs[i].data()['Ndestinatario'],
                      mensaje: snapshot.data.docs[i].data()['mensaje'], fotoremit: snapshot.data.docs[i].data()['fotoremit'],
                      fotodest: snapshot.data.docs[i].data()['fotodest'],date: snapshot.data.docs[i].data()['fecha']));
                }
            ),
          );
        }
      },
    );
    // return Contacto();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed:(){
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
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
                    "Mensajes Enviados",
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
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.08,
                  decoration: BoxDecoration(
                    color: Color(0XffC4C3C3),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.height*0.05))),
                    shape: BoxShape.rectangle,
                  ),
                  child: TextFormField(
                    autocorrect: true,
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search,
                        color: Colors.black,),
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Color(0Xff6c6c6c),
                        //fontFamily:
                      ),
                    ),

                    validator: (input)=> input.isEmpty ? 'Ingresa un Email válido' : null,
                    onChanged: (val){
                      setState(() => _Msjbuscar = val);
                    },

                  ),
                ),
              ],
            ),
            // correo()
           _Msjbuscar!=""? BuscaMsj():Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder(
                  stream: FirestoreAPI(TipMensaje:_Seccion).MensajesData,
                  builder: (context, snapshot) {
                    List<Mensaje> lstMensajes=snapshot.data;
                    if(!snapshot.hasData){
                      return Center(
                        child: Container(child: CircularProgressIndicator(color: Color(0Xff2056a1),)),
                      );
                    }
                    if(lstMensajes.length>0){
                      return ListView.builder(
                          itemCount: lstMensajes.length,
                          itemBuilder: (context, i){
                            return Center(
                              child: Dismissible(
                                direction: DismissDirection.endToStart,
                                key: new Key(lstMensajes[i].mensaje),
                                onDismissed: (direction) {
                                  FirestoreAPI(TipMensaje: _Seccion).eliminaMensaje(lstMensajes[i],_Seccion);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(duration: Duration(seconds: 1),content: Text('Mensaje eliminado.',textAlign: TextAlign.center,),backgroundColor: Colors.red,));
                                },
                                // Show a red background as the item is swiped away.
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(right: 20.0),
                                  color: Colors.red,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                child: correo(lstMensajes[i]),
                              ),
                            );
                          }
                      );
                    }
                    else
                      return Container(child: Center(child: Text('No hay mensajes para mostrar.'),),);
                  }
              ),
            ),
          ],
        ),

      ),
    );
  }

}