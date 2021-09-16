import 'package:camp/Usuarios/UI/Screens/eventos_profile_nuevo.dart';
import 'package:camp/Usuarios/UI/Screens/publicaciones_profile_neuva.dart';
import 'package:camp/Usuarios/model/Publicacion.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';

class PublicacionesProfileEdit extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _PublicacionesProfileEdit();
  }
}
class _PublicacionesProfileEdit extends State<PublicacionesProfileEdit>{

  Widget publicacion(Publicacion p){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(5,15,10,15),
          width: MediaQuery.of(context).size.width*0.87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(p.titulo, style:
                  TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.018,
                      fontWeight: FontWeight.w500
                  ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
              ),
              Container(
                child: Text(p.estado,style:
                TextStyle(
                    color: p.estado=='En espera'?Colors.red:Colors.green,
                    fontSize: MediaQuery.of(context).size.height*0.02,
                    fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),
        ),
        Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.001,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('NOMBRE: '+name);
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
                    "Publicaciones",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0Xff2056a1),
                        fontSize: MediaQuery.of(context).size.height*0.03,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.65,
              child: StreamBuilder<Object>(
                stream: FirestoreAPI().publicacionesPerfilData,
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Center(
                      child: Container(child: CircularProgressIndicator(color: Color(0Xff2056a1),)),
                    );
                  }
                  List<Publicacion> lstPublicaciones=snapshot.data;
                  if(lstPublicaciones.length>0){
                    return ListView.builder(
                        itemCount: lstPublicaciones.length,
                        itemBuilder: (context, i){
                          return publicacion(lstPublicaciones[i]);
                        }
                    );
                  }else
                    return Container(child:Center(child: Text('Aun no has realizado ninguna publicación.'),),);

                }
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: PublicacionesProfileNewEdit(), type: PageTransitionType.rightToLeft));
                  },
                  child: Container(
                    child: Text("Crear Publicación", style: TextStyle(
                        color: Color(0Xff2056a1),
                        fontSize: MediaQuery.of(context).size.height*0.02,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: EventosProfileNewEdit(), type: PageTransitionType.rightToLeft));
                  },
                  child: Container(
                    child: Text("Crear Evento", style: TextStyle(
                        color: Color(0Xff2056a1),
                        fontSize: MediaQuery.of(context).size.height*0.02,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}