import 'package:camp/Usuarios/model/Curso.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'CursosDetail.dart';
import 'MisionVision.dart';
import 'PoliticasPrivacidad.dart';
import 'PreguntasFrecuentes.dart';
import 'Prensa.dart';
import 'Quienes_Somos_Screen.dart';
import 'SociasCamp.dart';
class CursosScreenView extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _CursosScreenView();
  }
}
class _CursosScreenView extends State<CursosScreenView>{

  String _Titabuscar;

  Widget CursoCard(Curso c){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(child: CursosDetailScreenView(curso: c,), type: PageTransitionType.rightToLeft));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.375,
            height: MediaQuery.of(context).size.width*0.37,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(c.portada)
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(c.titulo, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: MediaQuery.of(context).size.height*0.017),),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: MediaQuery.of(context).size.height*0.02,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(c.imgponiente)
                      ),
                    ),)),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(c.poniente, style: TextStyle(
                  color: Colors.grey,
                  fontSize: MediaQuery.of(context).size.height*0.015,
                  fontWeight: FontWeight.w400,
                ),),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget BuscaPub(){
    return StreamBuilder<QuerySnapshot>(
      stream: (_Titabuscar != "" && _Titabuscar != null)
          ? FirebaseFirestore.instance
          .collection('cursos')
          .where("caseSearch", arrayContains: _Titabuscar)
          .where('estado',isEqualTo: 'Activo')
          .snapshots()
          : FirebaseFirestore.instance.collection('cursos').where('estado',isEqualTo: 'Activo').snapshots(),
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
            height: MediaQuery.of(context).size.height * 0.7,
            child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 233,
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i){
                  return CursoCard(new Curso(id: snapshot.data.docs[i].id,
                      poniente: snapshot.data.docs[i].data()['poniente'], imgponiente: snapshot.data.docs[i].data()['imgponiente'],
                      titulo: snapshot.data.docs[i].data()['titulo'], texto: snapshot.data.docs[i].data()['texto'],
                      fecha: snapshot.data.docs[i].data()['fecha'], estado: snapshot.data.docs[i].data()['estado'],
                      img1: snapshot.data.docs[i].data()['Img1'],img2: snapshot.data.docs[i].data()['Img2'],
                      portada: snapshot.data.docs[i].data()['portada']));
                }
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "CURSOS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: MediaQuery.of(context).size.height*0.03
              ),
            ),
          ],
        ),
        backgroundColor:Color(0Xff2056a1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.08,
                  decoration: BoxDecoration(
                      color: Colors.grey
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    color: Color(0Xff6c6c6c),
                    border: Border.all(
                      color: Color(0Xff6c6c6c),
                      width: 5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular((20.0))),
                    shape: BoxShape.rectangle,
                  ),
                  child: TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search,
                        color: Colors.white,),
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Color(0Xff6c6c6c),
                        //fontFamily:
                      ),
                    ),
                    onChanged: (val){
                      setState(() => _Titabuscar = val);
                    },

                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Cursos",style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.height*0.025
                  ),),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.003,
              decoration: BoxDecoration(
                  color: Colors.black
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),

            Container(
                width: MediaQuery.of(context).size.width*0.87,
                child: BuscaPub()),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),

          ],
        ),
      ),
    );
  }
}