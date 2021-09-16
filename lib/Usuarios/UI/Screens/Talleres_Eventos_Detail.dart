import 'package:camp/Usuarios/model/Evento.dart';
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
import 'Talleres_Eventos_Screen.dart';
class TalleresEventosDetailScreenView extends StatefulWidget with NavigationStates{
  Evento event;
  @override
  State createState() {
    return _TalleresEventosDetailScreenView();
  }
  TalleresEventosDetailScreenView({this.event});
}
class _TalleresEventosDetailScreenView extends State<TalleresEventosDetailScreenView>{
  @override

  Widget CargaDialog(){
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width*0.75,
        height: MediaQuery.of(context).size.height*0.3,
        child: Column(
          children: [
            Text("Participaras de "+this.widget.event.titulo +
              ' el día '+ this.widget.event.fecha,style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height*0.028
            ),textAlign: TextAlign.center,),
            Container(
                padding: const EdgeInsets.fromLTRB(0,20,0,0),
                width: MediaQuery.of(context).size.width*0.2,
                height: MediaQuery.of(context).size.height*0.13,
                child:
                Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor:  Colors.green,
                      child: Icon(Icons.check,size: 70,color: Colors.white,),
                      radius: 70.0,
                    ))
            ),
          ],
        ),
      ),
    );
  }

  Widget BorradorDialog(){
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width*0.7,
        height: MediaQuery.of(context).size.height*0.17,
        child: Column(
          children: [
            Text("¿Deseas participar de este evento?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*0.028
              ),),
            SizedBox(height: 3,),
            Container(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context, PageTransition(child: TalleresEventosScreenView(), type: PageTransitionType.leftToRight));
                    },
                    child: const Text('No',style: TextStyle(color: Colors.black38),),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0Xff2056a1),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      FirestoreAPI().createCalendarioData(this.widget.event.titulo,this.widget.event.fecha,this.widget.event.id);
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) => CargaDialog(),
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(context, PageTransition(child: TalleresEventosScreenView(), type: PageTransitionType.leftToRight));
                      });

                    },
                    child: const Text('Sí'),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
                height: MediaQuery.of(context).size.height*0.22,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(this.widget.event.portada)
                    ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width*0.1,
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.55,
                    child: Center(
                      child: Text(this.widget.event.titulo,style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.height*0.018
                      ),),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Center(
                      child: Text(this.widget.event.fecha,style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height*0.015
                      ),),
                    )
                  ),
                ],
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.8,
                // height: MediaQuery.of(context).size.height*0.2,
                child: Text(this.widget.event.texto,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height*0.018
                  ),),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.1, 10, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => BorradorDialog(),
                      );
                      /*Future.delayed(Duration(seconds: 3), () {
                        Navigator.pop(context);
                      });*/
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height*0.04,
                        width: MediaQuery.of(context).size.width*0.3,
                        color: Colors.black,
                        child: Center(
                          child: Text("Participar",style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.025,
                              color: Colors.white
                          ),),
                        )
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.07,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.width*0.3,
                      child: Center(
                        child: Text("Link del evento:",style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.height*0.02
                        ),),
                      )
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/zoom.png")
                  ),
                ),
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