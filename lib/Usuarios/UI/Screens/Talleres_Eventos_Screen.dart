
import 'package:camp/Usuarios/model/Evento.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'MisionVision.dart';
import 'PoliticasPrivacidad.dart';
import 'PreguntasFrecuentes.dart';
import 'Prensa.dart';
import 'Quienes_Somos_Screen.dart';
import 'SociasCamp.dart';
import 'Talleres_Eventos_Detail.dart';
class TalleresEventosScreenView extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _TalleresEventosScreenView();
  }
}
class _TalleresEventosScreenView extends State<TalleresEventosScreenView>{
  String _Titabuscar;

  @override
  Widget EventoTaller(Evento e){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, PageTransition(child: TalleresEventosDetailScreenView(event: e,), type: PageTransitionType.rightToLeft));
          },
          child:Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.22,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(e.portada)
                    ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                // height: MediaQuery.of(context).size.height*0.1,
                child: Text(e.texto,
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height*0.018
                  ),),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(e.titulo,style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.height*0.018
                    ),),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Text(e.fecha,style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height*0.015
                    ),),
                  ),

                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.03,
        ),
      ],
    );
  }

  Widget Contenido(){
    return StreamBuilder(
      stream: (_Titabuscar != "" && _Titabuscar != null)
          ? FirestoreAPI(search: 1,Txtabuscar: _Titabuscar).eventossData
          : FirestoreAPI().eventossData,
      builder: (context, snapshot) {
        List<Evento> lstEvento=snapshot.data;
        print(lstEvento.length.toString() + 'lenght');
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else
        if(lstEvento.length==0) {
          return Container(
              alignment: Alignment.center,
              height: 300,
              child: Text('Busqueda sin resultados'));
        }else {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
                itemCount: lstEvento.length,
                itemBuilder: (context, i){
                  return EventoTaller(lstEvento[i]);
                }
            ),
          );
        }
      },
    );
    // return Contacto();
  }

  Widget Footer(){
    return Container(
      height: MediaQuery.of(context).size.height*0.85,
      width: MediaQuery.of(context).size.width,
      color: Color(0Xff2056a1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/Logo - Camp.png")
                ),
              ),
            ),
            radius: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.1,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.05,
                width: MediaQuery.of(context).size.width*0.75,
                child: Text("SOBRE NOSOTROS", style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                    fontWeight: FontWeight.w600
                ),),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: Center(
              child: Text("Es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.",style:TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  color: Colors.white,
                  height: 1.5
              ),
                textAlign: TextAlign.justify,),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.001,
            decoration: BoxDecoration(
                color: Colors.white
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(child: QuienesSomosScreenView(), type: PageTransitionType.rightToLeft));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text("Quienes Somos", style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(child: MisionVisionScreenView(), type: PageTransitionType.rightToLeft));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text("Misión y Visión", style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(child: SociasCampScreenView(), type: PageTransitionType.rightToLeft));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text("Socias CAMP", style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(child: PreguntasFrecuentesScreenView(), type: PageTransitionType.rightToLeft));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text("Preguntas Frecuentes", style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(child: PoliticasDePrivacidadScreenView(), type: PageTransitionType.rightToLeft));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Text("Políticas de Privacidad", style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(child: PrensaScreenView(), type: PageTransitionType.rightToLeft));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text("Prensa", style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "TALLERES/EVENTOS",
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
                    //textAlign: TextAlign.center,
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

                    validator: (input)=> input.isEmpty ? 'Ingresa un Email válido' : null,
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
                  child: Text("Talleres y eventos",style: TextStyle(
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
            Contenido()
          ],
        ),
      )

    );
  }}