import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';

import 'MisionVision.dart';
import 'PoliticasPrivacidad.dart';
import 'PreguntasFrecuentes.dart';
import 'Prensa.dart';
import 'Quienes_Somos_Screen.dart';
import 'SociasCamp.dart';
class HomeScreenView extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _HomeScreenView();
  }
}
class _HomeScreenView extends State<HomeScreenView>{
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
              "HOME",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20
              ),
            ),
            SizedBox(
              width: 30,
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
              height: MediaQuery.of(context).size.height*0.005,
            ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              initialPage: 1,
              autoPlay: true,
            ),
            items: [
              Image(image: AssetImage("assets/images/Banner Principal - Home.png")),
              Image(image: AssetImage("assets/images/Banner Principal - Home.png"),),
              Image(image: AssetImage("assets/images/Banner Principal - Home.png"),),
              Image(image: AssetImage("assets/images/Banner Principal - Home.png"),),
            ],
          ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.005,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.01,
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.485,
                    height: MediaQuery.of(context).size.height*0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/Rincon del compliance I.png")
                      ),
                    ),
                  ),
                  Positioned(
                    top:MediaQuery.of(context).size.height*0.15,
                    left: MediaQuery.of(context).size.height*0.01,
                    child: Container(
                    child: Text("El rincón del compliance", style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height*0.02,
                      fontWeight: FontWeight.w400,
                    ),),
                  ),),
                  Positioned(
                    top:MediaQuery.of(context).size.height*0.01,
                    left: MediaQuery.of(context).size.height*0.2,
                    child: Icon(Icons.check_circle_outline,
                    size: MediaQuery.of(context).size.height*0.04,
                    color: Colors.white,),
                    ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.01,
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.485,
                    height: MediaQuery.of(context).size.height*0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/Rincon del compliance II.png")
                      ),
                    ),
                  ),
                  Positioned(
                    top:MediaQuery.of(context).size.height*0.15,
                    left: MediaQuery.of(context).size.height*0.01,
                    child: Container(
                      child: Text("El rincón del compliance", style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height*0.02,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),),
                  Positioned(
                    top:MediaQuery.of(context).size.height*0.01,
                    left: MediaQuery.of(context).size.height*0.2,
                    child: Icon(Icons.check_circle_outline,
                      size: MediaQuery.of(context).size.height*0.04,
                      color: Colors.white,),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.01,
              ),

            ],
          ),
            SizedBox(
              height: MediaQuery.of(context).size.width*0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.01,
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.485,
                      height: MediaQuery.of(context).size.height*0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/Nota I.png")
                        ),
                      ),
                    ),
                    Positioned(
                      top:MediaQuery.of(context).size.height*0.15,
                      left: MediaQuery.of(context).size.height*0.01,
                      child: Container(
                        child: Text("El rincón del compliance", style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height*0.02,
                          fontWeight: FontWeight.w400,
                        ),),
                      ),),
                    Positioned(
                      top:MediaQuery.of(context).size.height*0.01,
                      left: MediaQuery.of(context).size.height*0.2,
                      child: Icon(Icons.check_circle_outline,
                        size: MediaQuery.of(context).size.height*0.04,
                        color: Colors.white,),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.01,
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.485,
                      height: MediaQuery.of(context).size.height*0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/Nota II.png")
                        ),
                      ),
                    ),
                    Positioned(
                      top:MediaQuery.of(context).size.height*0.15,
                      left: MediaQuery.of(context).size.height*0.01,
                      child: Container(
                        child: Text("El rincón del compliance", style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height*0.02,
                          fontWeight: FontWeight.w400,
                        ),),
                      ),),
                    Positioned(
                      top:MediaQuery.of(context).size.height*0.01,
                      left: MediaQuery.of(context).size.height*0.2,
                      child: Icon(Icons.check_circle_outline,
                        size: MediaQuery.of(context).size.height*0.04,
                        color: Colors.white,),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.01,
                ),

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
                width: MediaQuery.of(context).size.width*0.98,
                height: MediaQuery.of(context).size.height*0.12,
                color: Color(0Xff2056a1),
                child: Center(
                  child: Text("Publicidad",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.height*0.02
                    ),),
                )
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
                  child: Text("Bolsa de trabajo",style: TextStyle(
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
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 1,
                autoPlay: true,
              ),
              items: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Text("Texto referencial para título de taller o evento",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: MediaQuery.of(context).size.height*0.018
                            ),),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.1,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.2,
                            child: Text("Fecha: Hora:",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.height*0.018
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height*0.017
                          ),),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Text("Texto referencial para título de taller o evento",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: MediaQuery.of(context).size.height*0.018
                            ),),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.1,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.2,
                            child: Text("Fecha: Hora:",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.height*0.018
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height*0.017
                          ),),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Text("Texto referencial para título de taller o evento",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: MediaQuery.of(context).size.height*0.018
                            ),),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.1,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.2,
                            child: Text("Fecha: Hora:",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.height*0.018
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height*0.017
                          ),),
                      ),
                    ],
                  ),
                ),
              ],
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
                width: MediaQuery.of(context).size.width*0.98,
                height: MediaQuery.of(context).size.height*0.12,
                color: Color(0Xff2056a1),
                child: Center(
                  child: Text("Publicidad",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.height*0.02
                    ),),
                )
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
                  child: Text("Notas Destacadas",style: TextStyle(
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
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Text("Texto referencial para nota destacada",style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.height*0.018
                  ),),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.3,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/noticia 1.png")
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width*0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Center(
                      child: Text("Es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.",style:TextStyle(
                          fontSize: MediaQuery.of(context).size.width*0.03,
                          fontWeight: FontWeight.w600
                      ),
                        textAlign: TextAlign.justify,),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.width*0.2,
                        child: Text("Fecha: Hora:",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.height*0.018
                        ),),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.25,
                      ),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.height*0.025,
                          backgroundColor: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                              ),
                            ),)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text("NOMBRE APELLIDO", style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width*0.024,
                          fontWeight: FontWeight.w400,
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Text("Texto referencial para nota destacada",style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.height*0.018
                  ),),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.3,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/NOTA 1.png")
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width*0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Center(
                      child: Text("Es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.",style:TextStyle(
                          fontSize: MediaQuery.of(context).size.width*0.03,
                          fontWeight: FontWeight.w600
                      ),
                        textAlign: TextAlign.justify,),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.width*0.2,
                        child: Text("Fecha: Hora:",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.height*0.018
                        ),),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.25,
                      ),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.height*0.025,
                          backgroundColor: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                              ),
                            ),)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text("NOMBRE APELLIDO", style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width*0.024,
                          fontWeight: FontWeight.w400,
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
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
                  child: Text("Entrevistas",style: TextStyle(
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
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.3,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/ENTREVISTA I.png")
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 1,
                autoPlay: true,
              ),
              items: [
                Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.12,
                    color: Color(0Xff2056a1),
                    child: Center(
                      child: Text("Publicidad",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.height*0.02
                        ),),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.12,
                    color: Color(0Xff2056a1),
                    child: Center(
                      child: Text("Publicidad",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.height*0.02
                        ),),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.12,
                    color: Color(0Xff2056a1),
                    child: Center(
                      child: Text("Publicidad",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.height*0.02
                        ),),
                    )
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.375,
                      height: MediaQuery.of(context).size.width*0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/images/Curso I.png")
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text("Nombre del curso I", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: MediaQuery.of(context).size.height*0.017),),
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
                                    image: AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                                ),
                              ),)),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("Nombre Apellido", style: TextStyle(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.height*0.015,
                            fontWeight: FontWeight.w400,
                          ),),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.375,
                      height: MediaQuery.of(context).size.width*0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/images/Curso II.png")
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text("Nombre del curso II", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: MediaQuery.of(context).size.height*0.017),),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height*0.02,
                            backgroundColor: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                                ),
                              ),)),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("Nombre Apellido", style: TextStyle(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.height*0.015,
                            fontWeight: FontWeight.w400,
                          ),),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.375,
                      height: MediaQuery.of(context).size.width*0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/images/Curso I.png")
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text("Nombre del curso I", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: MediaQuery.of(context).size.height*0.017),),
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
                                    image: AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                                ),
                              ),)),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("Nombre Apellido", style: TextStyle(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.height*0.015,
                            fontWeight: FontWeight.w400,
                          ),),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.375,
                      height: MediaQuery.of(context).size.width*0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/images/Curso II.png")
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text("Nombre del curso II", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: MediaQuery.of(context).size.height*0.017),),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height*0.02,
                            backgroundColor: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                                ),
                              ),)),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text("Nombre Apellido", style: TextStyle(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.height*0.015,
                            fontWeight: FontWeight.w400,
                          ),),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
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
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.22,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/Talle I.png")
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.1,
              child: Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ea commodo consequat.",
                textAlign: TextAlign.justify,
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
                  child: Text("Texto referencial para título de taller o evento",style: TextStyle(
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
                  child: Text("Fecha: Hora:",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height*0.018
                  ),),
                ),

              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.22,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/Taller II.png")
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.1,
              child: Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ea commodo consequat.",
                textAlign: TextAlign.justify,
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
                  child: Text("Texto referencial para título de taller o evento",style: TextStyle(
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
                  child: Text("Fecha: Hora:",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height*0.018
                  ),),
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
      )

    );
  }}