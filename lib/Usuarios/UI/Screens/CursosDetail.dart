import 'package:camp/Usuarios/model/Curso.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'MisionVision.dart';
import 'PoliticasPrivacidad.dart';
import 'PreguntasFrecuentes.dart';
import 'Prensa.dart';
import 'Quienes_Somos_Screen.dart';
import 'SociasCamp.dart';
class CursosDetailScreenView extends StatefulWidget with NavigationStates{
  Curso curso;
  CursosDetailScreenView({this.curso});
  @override
  State createState() {
    return _CursosDetailScreenView();
  }
}
class _CursosDetailScreenView extends State<CursosDetailScreenView>{

  Widget LoadIMG(String url){
    return url!=null?Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.22,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(url)
          ),
        ),
      ),
    )
    :Container();
  }

  Widget Footer(){
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
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

  Widget CursoCard(Curso c){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(child: CursosDetailScreenView(curso: c,), type: PageTransitionType.rightToLeft));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.37,
            height: MediaQuery.of(context).size.width*0.3,
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

  Widget Contenido(){
    return StreamBuilder(
        stream: FirestoreAPI(Searchsize: 6).cursossData,
        builder: (context, snapshot) {
          List<Curso> lstcursos=snapshot.data;
          if(!snapshot.hasData){
            return Center(
              child: Container(child: CircularProgressIndicator(color: Color(0Xff2056a1),)),
            );
          }
          if(lstcursos.length>0)
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 200,
                crossAxisCount: 2,
              ),
              itemCount: lstcursos.length,
              itemBuilder: (BuildContext ctxt, int i) {
                return CursoCard(lstcursos[i]);
              },
            );
          else
            return Center(child: Text('No hay cursos para mostrar.'),);

        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.22,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(this.widget.curso.portada)
                ),
              ),
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
                  height: MediaQuery.of(context).size.height*0.04,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Text(this.widget.curso.titulo,style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.height*0.025
                    ),),

                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  child: Text(this.widget.curso.poniente, style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.015,
                  ),),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.03,
                  child: Text("Fecha:", style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.015,
                  ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.2,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              // height: MediaQuery.of(context).size.height*0.2,
              child: Text(this.widget.curso.texto,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height*0.018
                ),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            LoadIMG(this.widget.curso.img1),
            LoadIMG(this.widget.curso.img2),
            LoadIMG(this.widget.curso.img3),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Mis Cursos",style: TextStyle(
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
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: MediaQuery.of(context).size.width*0.9,
                child: Contenido()),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}