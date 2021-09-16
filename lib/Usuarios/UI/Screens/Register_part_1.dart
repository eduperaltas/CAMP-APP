import 'dart:io';

import 'package:camp/Usuarios/UI/Screens/sidebar.dart';
import 'package:camp/Usuarios/bloc/bloc_user.dart';
import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

import 'Home_Screen.dart';
import 'Profile_screen.dart';




class Register_part1_view extends StatefulWidget{
  @override
  State createState() {
    return _Register_part1_view();
  }
  User user;
  Register_part1_view({this.user});
}
class _Register_part1_view extends State<Register_part1_view>{
  UserBloc userBloc;
  String url;
  File sampleImage;

  Future getImagegaleria() async {
    print('en getimage');
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = File(tempImage.path);
    });
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
    widget.user.photoURL=url;
    FirestoreAPI().createUserData(widget.user);
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  color: Color(0Xff2056a1),
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BIENVENIDA A ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height*0.04,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "CAMP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height*0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      widget.user.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height*0.04,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height:MediaQuery.of(context).size.height*0.05,
            ),
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0Xff2056a1),
                        width: MediaQuery.of(context).size.height*0.004,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: sampleImage!=null?FileImage(sampleImage):AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                      ),
                    ),
                  ),
                  radius: MediaQuery.of(context).size.height*0.13,
                ),

                Positioned(
                    child: GestureDetector(
                      onTap: (){ getImagegaleria();},
                      child: Container(
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: Color(0Xff2056a1),
                          width: MediaQuery.of(context).size.height*0.015,
                        ),
                        color: Color(0Xff2056a1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.edit,color:Colors.white,),
                    ),),
                    top: MediaQuery.of(context).size.height*0.19,
                    left: MediaQuery.of(context).size.width*0.36,
                )
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Center(
              child: Container(
                child: Text(
                  "Sube una foto",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.03,
                      fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
           Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: Text(
                  "Este es un texto referencial para colocar un mensaje de bienvenida a la plataforma",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*0.025,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            GestureDetector(
              onTap: (){
                sampleImage!=null? uploadPost()
                    : FirestoreAPI().createUserData(widget.user);
                Navigator.push(context, PageTransition(child: SideBar(), type: PageTransitionType.rightToLeft));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.22,
                    color: Color(0Xff2056a1),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.height*0.1,
                        height: MediaQuery.of(context).size.height*0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: FittedBox(
                          child: Icon(Icons.arrow_forward,
                              size: MediaQuery.of(context).size.height*0.08,
                              color: Color(0Xff2056a1)),
                        ),
                      ),

                    ],
                  )


                ],
              ),
            )
/*          CircleAvatar(
              radius: 25.0,
              backgroundImage:
              NetworkImage(user.photoURL)
          )*/
          ],
        ),
      )
    );
  }



}