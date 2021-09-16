import 'package:camp/Usuarios/UI/Screens/papelera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Borradores.dart';
import 'Buzon_de_entrada.dart';
import 'Mensajes_enviados.dart';
import 'Notificaciones_mensajes.dart';
import 'mensajes_profile_nueva.dart';

class MensajesProfileEdit extends StatefulWidget{
  @override
  State createState() {
    return _MensajesProfileEdit();
  }
}
class _MensajesProfileEdit extends State<MensajesProfileEdit>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed:(){
                Navigator.of(context).pop();
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Mensajes",
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
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.height*0.015,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0Xff2056a1),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.015,
                  ),

                  Text("BUZÓN DE ENTRADA", style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.025,
                  ),),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.06,
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(context, PageTransition(child: BuzonDeEntrada(), type: PageTransitionType.rightToLeft));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle,
                        border:Border.all(color: Color(0Xff2056a1),width: 1),
                      ),
                      child: Icon(Icons.arrow_forward,
                        size: MediaQuery.of(context).size.height*0.04,
                        color: Color(0Xff2056a1),),
                    ),
                  )
                ],

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.height*0.015,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.015,
                  ),
                  Text("MENSAJES ENVIADOS", style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.025
                  ),),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.04,
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(context, PageTransition(child: MensajesEnviados(), type: PageTransitionType.rightToLeft));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle,
                        border:Border.all(color: Color(0Xff2056a1),width: 1),
                      ),
                      child: Icon(Icons.arrow_forward,
                        size: MediaQuery.of(context).size.height*0.04,
                        color: Color(0Xff2056a1),),
                    ),
                  )
                ],

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.height*0.015,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.015,
                  ),
                  Text("BORRADORES", style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.025
                  ),),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.135,
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(context, PageTransition(child: Borradores(), type: PageTransitionType.rightToLeft));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle,
                        border:Border.all(color: Color(0Xff2056a1),width: 1),
                      ),
                      child: Icon(Icons.arrow_forward,
                        size: MediaQuery.of(context).size.height*0.04,
                        color: Color(0Xff2056a1),),
                    ),
                  )
                ],

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     SizedBox(
              //       width: MediaQuery.of(context).size.height*0.05,
              //     ),
              //     Container(
              //       height: MediaQuery.of(context).size.height*0.08,
              //       width: MediaQuery.of(context).size.height*0.015,
              //       decoration: BoxDecoration(
              //         shape: BoxShape.rectangle,
              //         color: Colors.grey,
              //       ),
              //     ),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.height*0.015,
              //     ),
              //     Text("NOTIFICACIONES", style: TextStyle(
              //         fontSize: MediaQuery.of(context).size.height*0.025
              //     ),),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.height*0.1,
              //     ),
              //     GestureDetector(
              //       onTap: (){
              //
              //         Navigator.push(context, PageTransition(child: NotificaionesMensaje(), type: PageTransitionType.rightToLeft));
              //
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //           color: Colors.white54,
              //           shape: BoxShape.circle,
              //           border:Border.all(color: Color(0Xff2056a1),width: 1),
              //         ),
              //         child: Icon(Icons.arrow_forward,
              //           size: MediaQuery.of(context).size.height*0.04,
              //           color: Color(0Xff2056a1),),
              //       ),
              //     )
              //   ],
              //
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height*0.03,
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.height*0.015,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:  Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.015,
                  ),
                  Text("PAPELERA", style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.025
                  ),),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.18,
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(context, PageTransition(child: PapeleraMensaje(), type: PageTransitionType.rightToLeft));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle,
                        border:Border.all(color: Color(0Xff2056a1),width: 1),
                      ),
                      child: Icon(Icons.arrow_forward,
                        size: MediaQuery.of(context).size.height*0.04,
                        color: Color(0Xff2056a1),),
                    ),
                  )
                  /*SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                ),*/
                ],

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              GestureDetector(
                onTap: (){

                   Navigator.push(context, PageTransition(child: NuevoMensaje(), type: PageTransitionType.rightToLeft));


                  /*if(_formKey.currentState.validate()){
                          await _auth.signInWithEmailAndPassword(_email, _password);
                        }*/
                },
                child: Container(
                    //alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular((20.0))),
                        color: Color(0Xff2056a1),
                        shape: BoxShape.rectangle
                    ),
                    child: Center(
                      child: Text("NUEVO MENSAJE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.height*0.02
                        ),),
                    )
                ),
              ),

            ],
          ),
        )
    );
  }}