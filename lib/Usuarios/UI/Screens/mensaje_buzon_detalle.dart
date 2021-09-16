import 'package:camp/Usuarios/model/mensaje.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Mensajes_buzon_detail extends StatefulWidget{
  Mensaje msj;
  String desdeSeccion;
  @override
  State createState() {
    return _Mensajes_buzon_detail();
  }
  Mensajes_buzon_detail({this.msj,this.desdeSeccion});
}
class _Mensajes_buzon_detail extends State<Mensajes_buzon_detail>{
  @override
  Widget build(BuildContext context) {
    String seccion=this.widget.desdeSeccion;
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
                    //Navigator.push(context, PageTransition(child: RegisterView(), type: PageTransitionType.rightToLeft));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Mensaje",
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
            Container(
              color: Color(0XffC4C3C3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.001,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.1,
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
                            image: seccion=='entrada'?NetworkImage(this.widget.msj.fotoremit):NetworkImage(this.widget.msj.fotodest)
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
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.03,
                        child: Text( seccion=='entrada'?this.widget.msj.Nremitente:this.widget.msj.Ndestinatario,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: MediaQuery.of(context).size.height*0.02
                          ),
                        ),
                      ),
                      /*Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.031,
                        child: Text("Es un hecho establecido hace demasiado tiempo que un lector se.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).size.height*0.015
                          ),
                        ),
                      ),*/
                    ],
                  ),
                  /*SizedBox(
                    width: MediaQuery.of(context).size.width*0.05,
                  ),*/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.025,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.25,
                        height: MediaQuery.of(context).size.height*0.031,
                        child: Text(this.widget.msj.date,
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
            Container(
              color: Color(0XffC4C3C3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.001,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              // height: MediaQuery.of(context).size.height*0.02,
              child: Text(this.widget.msj.mensaje,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.02
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}