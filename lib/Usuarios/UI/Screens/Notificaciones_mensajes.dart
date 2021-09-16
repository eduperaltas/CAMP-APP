import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Lista_contactos_profile_detail.dart';
import 'mensaje_buzon_detalle.dart';

class NotificaionesMensaje extends StatefulWidget{
  @override
  State createState() {
    return _NotificaionesMensaje();
  }
}
class _NotificaionesMensaje extends State<NotificaionesMensaje>{
  @override
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
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: Mensajes_buzon_detail(), type: PageTransitionType.rightToLeft));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Notificaciones",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0Xff2056a1),
                          fontSize: MediaQuery.of(context).size.height*0.03,
                          fontWeight: FontWeight.bold),
                    ),
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
                      //setState(() => _email = val);
                    },

                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(context, PageTransition(child: Mensajes_buzon_detail(), type: PageTransitionType.rightToLeft));

              },

              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
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
                              image: AssetImage("assets/images/foto_perfil_prueba.jpg")
                          ),
                        ),
                      ),
                      radius: MediaQuery.of(context).size.height*0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.03,
                          child: Text("Nombre Apellido",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: MediaQuery.of(context).size.height*0.02
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Es un hecho establecido hace demasiado tiempo que un lector se.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.05,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Apr 07",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
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
              height: MediaQuery.of(context).size.height*0.001,
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(context, PageTransition(child: Mensajes_buzon_detail(), type: PageTransitionType.rightToLeft));

              },

              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
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
                              image: AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                          ),
                        ),
                      ),
                      radius: MediaQuery.of(context).size.height*0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.03,
                          child: Text("Nombre Apellido",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: MediaQuery.of(context).size.height*0.02
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Es un hecho establecido hace demasiado tiempo que un lector se.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.05,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Apr 07",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
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
              height: MediaQuery.of(context).size.height*0.001,
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(context, PageTransition(child: Mensajes_buzon_detail(), type: PageTransitionType.rightToLeft));

              },

              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
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
                              image: AssetImage("assets/images/foto_perfil_prueba.jpg")
                          ),
                        ),
                      ),
                      radius: MediaQuery.of(context).size.height*0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.03,
                          child: Text("Nombre Apellido",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: MediaQuery.of(context).size.height*0.02
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Es un hecho establecido hace demasiado tiempo que un lector se.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.05,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Apr 07",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
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
              height: MediaQuery.of(context).size.height*0.001,
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(context, PageTransition(child: Mensajes_buzon_detail(), type: PageTransitionType.rightToLeft));

              },

              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
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
                              image: AssetImage("assets/images/Logo - Camp.png")
                          ),
                        ),
                      ),
                      radius: MediaQuery.of(context).size.height*0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.03,
                          child: Text("Nombre Apellido",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: MediaQuery.of(context).size.height*0.02
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Es un hecho establecido hace demasiado tiempo que un lector se.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.05,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Apr 07",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
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
              height: MediaQuery.of(context).size.height*0.001,
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(context, PageTransition(child: Mensajes_buzon_detail(), type: PageTransitionType.rightToLeft));

              },

              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
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
                              image: AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                          ),
                        ),
                      ),
                      radius: MediaQuery.of(context).size.height*0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.03,
                          child: Text("Nombre Apellido",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: MediaQuery.of(context).size.height*0.02
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Es un hecho establecido hace demasiado tiempo que un lector se.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.05,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Apr 07",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
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
              height: MediaQuery.of(context).size.height*0.001,
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(context, PageTransition(child: Mensajes_buzon_detail(), type: PageTransitionType.rightToLeft));

              },

              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
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
                              image: AssetImage("assets/images/Logo - Camp.png")
                          ),
                        ),
                      ),
                      radius: MediaQuery.of(context).size.height*0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.03,
                          child: Text("Nombre Apellido",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: MediaQuery.of(context).size.height*0.02
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Es un hecho establecido hace demasiado tiempo que un lector se.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.05,
                          height: MediaQuery.of(context).size.height*0.031,
                          child: Text("Apr 07",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height*0.015
                            ),
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
              height: MediaQuery.of(context).size.height*0.001,
            ),



          ],
        ),

      ),
    );
  }
}