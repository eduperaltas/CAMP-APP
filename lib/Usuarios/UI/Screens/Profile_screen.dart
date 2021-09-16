
import 'dart:io';

import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

import 'Lista_contactos_profile.dart';
import 'Profile_Profesional_screen.dart';
import 'Profile_screen_edit.dart';
import 'agenda_profile.dart';
import 'mensajes_profile.dart';
import 'publicaciones_profile.dart';
class ProfileScreenView extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _ProfileScreenView();
  }
}
class _ProfileScreenView extends State<ProfileScreenView>{
  @override
  String url;
  File sampleImage;

  Future getImagegaleria() async {
    print('en getimage');
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = File(tempImage.path);
    });
    uploadPost();
  }


  void uploadPost() async {
      //Subir imagen a firebase storage
      final firebase_storage.Reference postImageRef =
      firebase_storage.FirebaseStorage.instance.ref().child("Perfil Usuario");
      // var timekey = DateTime.now().day+DateTime.now().month+DateTime.now().year+DateTime.now().hour;
      final firebase_storage.UploadTask uploadTask =
      postImageRef.child(uid+".jpg").putFile(sampleImage);
      var imageUrl = await(await uploadTask).ref.getDownloadURL();
      url = imageUrl.toString();
      FirestoreAPI().editProfilePhoto(url);
  }

  Widget screen(BuildContext context, User user){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        backgroundColor:Color(0Xff2056a1),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                              image: user.photoURL!=null?NetworkImage(user.photoURL): AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                          ),
                        ),
                      ),
                      radius: MediaQuery.of(context).size.height*0.06,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    GestureDetector(
                      onTap: (){
                        getImagegaleria();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height*0.12,
                            child: Text("Cambiar foto",style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.02,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                          Icon(Icons.edit,
                            size: MediaQuery.of(context).size.height*0.025,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.02,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(user.name+' '+user.lastname, style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height*0.02
                      ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.01,
                      ),
                      Text(user.email,style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height*0.02
                      ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.01,
                      ),
                      Container(
                        child: Center(
                          child: Text("Cuenta "+user.tipCuenta,
                            style: TextStyle(color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height*0.02),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.height*0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.black,
                        ),),
                    ]
                )

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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

                    Icon(Icons.person, size: MediaQuery.of(context).size.height*0.04,  color: Color(0Xff2056a1)),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.015,
                    ),

                    Text("Perfil profesional", style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*0.03,
                    ),),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.03,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(child: ProfileProfesionalScreenEdit(), type: PageTransitionType.rightToLeft));
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
                    Icon(Icons.mail_outline, size:MediaQuery.of(context).size.height*0.04,  color: Color(0Xff2056a1)),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.015,
                    ),
                    Text("Mensajes", style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.03
                    ),),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.13,
                    ),
                    GestureDetector(
                      onTap: (){

                        Navigator.push(context, PageTransition(child: MensajesProfileEdit(), type: PageTransitionType.rightToLeft));

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
                    Icon(Icons.published_with_changes, size: MediaQuery.of(context).size.height*0.04,  color: Color(0Xff2056a1)),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.015,
                    ),
                    Text("Publicaciones", style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.03
                    ),),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.07,
                    ),
                    GestureDetector(
                      onTap: (){

                        Navigator.push(context, PageTransition(child: PublicacionesProfileEdit(), type: PageTransitionType.rightToLeft));

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

                    Icon(Icons.contact_page_outlined, size: MediaQuery.of(context).size.height*0.04,  color: Color(0Xff2056a1)),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.015,
                    ),
                    Text("Lista de contactos", style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.03
                    ),),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.015,
                    ),
                    GestureDetector(
                      onTap: (){

                        Navigator.push(context, PageTransition(child: ListaContactosProfileEdit(), type: PageTransitionType.rightToLeft));

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
                        color:  Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.015,
                    ),

                    Icon(Icons.calendar_today_outlined, size: MediaQuery.of(context).size.height*0.04,  color: Color(0Xff2056a1)),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.015,
                    ),
                    Text("Agenda", style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.03
                    ),),
                    SizedBox(
                      width: MediaQuery.of(context).size.height*0.16,
                    ),
                    GestureDetector(
                      onTap: (){

                        Navigator.push(context, PageTransition(child: AgendaProfileEdit(), type: PageTransitionType.rightToLeft));

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
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.07,
            ),
          ],
        ),
      ),

    );
  }

  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirestoreAPI().userData,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (!snapshot.hasData) {
          return Center();
          // <---- no return here
        }
        User user = snapshot.data;
        return screen(context,user);
      },
    );
    // TODO: implement build

  }}