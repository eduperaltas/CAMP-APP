import 'package:camp/Usuarios/UI/Screens/register.dart';
import 'package:camp/Usuarios/model/Publicacion.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'MisionVision.dart';
import 'Mural_Screen.dart';
import 'PoliticasPrivacidad.dart';
import 'PreguntasFrecuentes.dart';
import 'Prensa.dart';
import 'Quienes_Somos_Screen.dart';
import 'SociasCamp.dart';
class MuralDetailScreenView extends StatefulWidget with NavigationStates{
  List<Publicacion> pub;
  int index;
  @override
  State createState() {
    return _MuralDetailScreenView();
  }
  MuralDetailScreenView({this.pub,this.index});
}
class _MuralDetailScreenView extends State<MuralDetailScreenView>{
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
              "MURAL",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*0.03
              ),
            ),
          ],
        ),
        backgroundColor:Color(0Xff2056a1),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(widget.pub[widget.index].portada)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width*0.8,
              child: Center(
                child: Text(widget.pub[widget.index].titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.height*0.028
                ),),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width*0.04, 0),
                width: MediaQuery.of(context).size.width*0.45,
                child: Center(
                  child: Text('Fecha: '+widget.pub[widget.index].fecha
                    ,style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.017
                  ),),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(vertical: 10),
              // height: MediaQuery.of(context).size.height*0.3,
              child: Center(
                child: Text(this.widget.pub[widget.index].texto,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height*0.018,
                  ),),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.pub[widget.index].img1!=""?Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(widget.pub[widget.index].img1)
                    ),
                  ),
                ):Container(),
                if(widget.pub[widget.index].img2!=null) SizedBox(width: 20,),
                widget.pub[widget.index].img2!=""?Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(widget.pub[widget.index].img2)
                    ),
                  ),
                ):Container(),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                    radius: MediaQuery.of(context).size.height*0.025,
                    backgroundColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.pub[widget.index].Autorfoto)
                        ),
                      ),)),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(widget.pub[widget.index].Autorname, style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.height*0.02,
                    fontWeight: FontWeight.w400,
                  ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(this.widget.index==0)
                        this.widget.index=this.widget.pub.length-1;
                      else
                        this.widget.index--;
                    });
                    // Navigator.push(context, PageTransition(child: MuralDetailScreenView(), type: PageTransitionType.leftToRight));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,size: MediaQuery.of(context).size.height*0.02,),
                      Container(
                          height: MediaQuery.of(context).size.height*0.1,
                          width: MediaQuery.of(context).size.width*0.2,
                          child: Center(
                            child: Text("Anterior", style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height*0.02,
                              //fontWeight: FontWeight.w400,
                            ),),
                          )
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: MuralScreenView(), type: PageTransitionType.bottomToTop));
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height*0.12,
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Center(
                        child: Text("MÁS PUBLICACIONES", style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height*0.02,
                          //fontWeight: FontWeight.w400,
                        ),),
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(this.widget.index==this.widget.pub.length-1)
                        this.widget.index=0;
                      else
                        this.widget.index++;
                    });
                    // Navigator.push(context, PageTransition(child: MuralDetailScreenView(), type: PageTransitionType.rightToLeft));
                  },
                  child: Row(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height*0.1,
                          width: MediaQuery.of(context).size.width*0.2,
                          child: Center(
                            child: Text("Siguiente", style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height*0.02,
                              //fontWeight: FontWeight.w400,
                            ),),
                          )
                      ),
                      Icon(Icons.arrow_forward_ios,size: MediaQuery.of(context).size.height*0.02,),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
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
  }}