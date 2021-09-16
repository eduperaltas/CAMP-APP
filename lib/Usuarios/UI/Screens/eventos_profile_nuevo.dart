import 'package:camp/Usuarios/model/Evento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:camp/Usuarios/UI/Screens/publicaciones_profile.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class EventosProfileNewEdit extends StatefulWidget{
  @override
  State createState() {
    return _EventosProfileNewEdit();
  }
}
class _EventosProfileNewEdit extends State<EventosProfileNewEdit>{
  String _pubTit,_pubText,_link;
  String urlPortada,urlImg1,urlImg2;
  File imgPortada,img1,img2;
  Evento evento;

  String _date,_time;

  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      locale: Locale('es','PE'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 180)),
      helpText: 'Seleccione una fecha',
    );
    if (newDate != null) {
      setState(() {
        _date =DateFormat('dd/MM/yyyy').format(newDate);
      });
      _selectTime();
    }
  }

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: 'Seleccione una hora',
    );
    if (newTime != null) {
      setState(() {
        _time =  (newTime.hour<10?'0':'')+newTime.hour.toString()+':'+(newTime.minute<10?'0':'')+newTime.minute.toString()+' '+(newTime.hour<10?'A.M':'P.M');
      });
    }
  }


  Future getImagegaleria(int n) async {
    print('en getimage');
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(n==1)imgPortada = File(tempImage.path);
      if(n==2)img1 = File(tempImage.path);
      if(n==3)img2 = File(tempImage.path);
    });
  }

  void uploadPost() async {
    //Subir imagen a firebase storage
    final firebase_storage.Reference postImageRef =
    firebase_storage.FirebaseStorage.instance.ref().child("Eventos");
    var timekey = (DateTime.now().day+DateTime.now().month+DateTime.now().year+
        DateTime.now().hour+DateTime.now().minute+DateTime.now().second).toString();
    final firebase_storage.UploadTask uploadTask =
    postImageRef.child(uid+timekey+".jpg").putFile(imgPortada);

    var urlPortada = await(await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
    evento.portada=urlPortada.toString();

    if(img1!=null){
      var timekey1 = (DateTime.now().day+DateTime.now().month+DateTime.now().year+
          DateTime.now().hour+DateTime.now().minute+DateTime.now().second).toString();
      final firebase_storage.UploadTask uploadTask1 =
      postImageRef.child(uid+timekey1+".jpg").putFile(img1);

      var urlImg1 = await(await uploadTask1.whenComplete(() => null)).ref.getDownloadURL();
      evento.img1=urlImg1.toString();
    }

    if(img2!=null){
      var timekey2 = (DateTime.now().day+DateTime.now().month+DateTime.now().year+
          DateTime.now().hour+DateTime.now().minute+DateTime.now().second).toString();
      final firebase_storage.UploadTask uploadTask2 =
      postImageRef.child(uid+timekey2+".jpg").putFile(img2);

      var urlImg2 = await(await uploadTask2.whenComplete(() => null)).ref.getDownloadURL();
      evento.img2=urlImg2.toString();
    }

    FirestoreAPI().createEventData(evento);

  }


  Widget CargaDialog(String carga){
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width*0.7,
        height: MediaQuery.of(context).size.height*0.2,
        child: Column(
          children: [
            Text(carga=='listo'?"Evento Creadao":"Creando Evento",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height*0.028
            ),),
            Container(
                padding: const EdgeInsets.fromLTRB(0,20,0,0),
                width: MediaQuery.of(context).size.width*0.2,
                height: MediaQuery.of(context).size.height*0.13,
                child:  carga=='listo'?
                Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor:  Colors.green,
                      child: Icon(Icons.check,size: 70,color: Colors.white,),
                      radius: 70.0,
                    )):CircularProgressIndicator(color: Color(0Xff2056a1) ,strokeWidth: 8,)
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed:(){
            Navigator.push(context, PageTransition(child: PublicacionesProfileEdit(), type: PageTransitionType.leftToRight));
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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Crear Evento",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0Xff2056a1),
                        fontSize: MediaQuery.of(context).size.height*0.03,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),

            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Título de Evento",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.02
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.025, top:MediaQuery.of(context).size.height*0.002 ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.02,
                    ),
                  ),
                  validator: (input)=> input.isEmpty ? 'Ingresa un título válido' : null,
                  onChanged: (val){
                    setState(() => _pubTit = val);
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0,10, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fecha: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.022
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _selectDate();
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Color(0Xff2056a1), spreadRadius: 2.5),
                        ],
                      ),
                      child: Center(
                        child: Text((_date!=null && _time!=null)?_date+' '+_time:"Selecciona Fecha",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.021
                          ),),
                      )
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.075,
                ),
              ],),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.075,
                ),
                GestureDetector(
                  onTap: (){
                    getImagegaleria(1);
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                          color: Color(0Xff2056a1),
                          shape: BoxShape.rectangle
                      ),
                      child: Center(
                        child: Text("Cargar Portada",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: MediaQuery.of(context).size.height*0.02
                          ),),
                      )
                  ),
                ),
              ],),
            imgPortada!=null?Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: FileImage(imgPortada)
                  ),
                ),
              ),
            ):Container(),

            imgPortada!=null?Container():SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.075,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Texto",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.02
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.85,
              height: MediaQuery.of(context).size.height*0.6,
              //margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.025, top:MediaQuery.of(context).size.height*0.002 ),
                child: TextFormField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.02,
                      //fontFamily:
                    ),
                  ),
                  enableInteractiveSelection: true,
                  maxLines: 21,
                  onChanged: (val){
                    setState(() => _pubText = val);
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Link de Evento",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.02
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.025, top:MediaQuery.of(context).size.height*0.002 ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.02,
                    ),
                  ),
                  validator: (input)=> input.isEmpty ? 'Ingresa un título válido' : null,
                  onChanged: (val){
                    setState(() => _link = val);
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                img1!=null?GestureDetector(
                  onTap: (){ getImagegaleria(2); },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(img1)
                      ),
                    ),
                  ),
                ):Container(),
                if(img2!=null) SizedBox(width: 20,),
                img2!=null?GestureDetector(
                  onTap: (){ getImagegaleria(3); },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(img2)
                      ),
                    ),
                  ),
                ):Container(),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.075,
                ),
                GestureDetector(
                  onTap: (){
                    if(img1==null)getImagegaleria(2);
                    if(img1!=null && img2==null)getImagegaleria(3);
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                          color: Color(0Xff2056a1),
                          shape: BoxShape.rectangle
                      ),
                      child: Center(
                        child: Text("Cargar Imágenes",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: MediaQuery.of(context).size.height*0.02
                          ),),
                      )
                  ),
                ),
              ],),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.075,
                ),
                GestureDetector(
                  onTap: (){
                    if(_pubTit!=null && _pubText!=null && _date!=null && _time!=null)
                      {
                        evento= new Evento(
                            id: _pubTit.substring(1,3)+uid.substring(1,3)+_date.substring(0,2)+_time.substring(0,1),
                            Autorid: uid,
                            titulo: _pubTit,
                            texto: _pubText,
                            link:_link,
                            fecha: _date+' '+_time,
                            estado: 'Activo');
                        uploadPost();
                        showDialog(
                          context: context,
                          builder: (context) => CargaDialog('carga'),
                        );
                        Future.delayed(Duration(seconds: 2), () {
                          showDialog(
                            context: context,
                            builder: (context) => CargaDialog('listo'),
                          );
                        });
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.push(context, PageTransition(child: PublicacionesProfileEdit(), type: PageTransitionType.rightToLeft));
                        });
                      }
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                          color: (_pubTit!=null && _pubText!=null && _date!=null && _time!=null)?Color(0Xff2056a1):Colors.black26,
                          shape: BoxShape.rectangle
                      ),
                      child: Center(
                        child: Text("Guardar",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: MediaQuery.of(context).size.height*0.02
                          ),),
                      )
                  ),
                ),
              ],),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),

          ],
        ),
      ),
    );
  }
}
