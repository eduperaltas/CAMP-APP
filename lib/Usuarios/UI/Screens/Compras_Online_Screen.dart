import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'CursosDetail.dart';
import 'MisionVision.dart';
import 'Mural_Detail.dart';
import 'PoliticasPrivacidad.dart';
import 'PreguntasFrecuentes.dart';
import 'Prensa.dart';
import 'Quienes_Somos_Screen.dart';
import 'SociasCamp.dart';
class ComprasOnlineScreenView extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _ComprasOnlineScreenView();
  }
}
class _ComprasOnlineScreenView extends State<ComprasOnlineScreenView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "COMPRAS ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ),
                ),
                Text(
                  "ONLINE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20
                  ),
                ),
              ],
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
                      //setState(() => _email = val);
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
                  child: Text("Compras Online",style: TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/LogosComprasOnline.jpg")
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/LogosComprasOnline.jpg")
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/LogosComprasOnline.jpg")
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/LogosComprasOnline.jpg")
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/LogosComprasOnline.jpg")
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/LogosComprasOnline.jpg")
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/LogosComprasOnline.jpg")
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/LogosComprasOnline.jpg")
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}