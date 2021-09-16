import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import 'Lista_contactos_profile_detail.dart';

class ListaContactosProfileEdit extends StatefulWidget{
  @override
  State createState() {
    return _ListaContactosProfileEdit();
  }
}class _ListaContactosProfileEdit extends State<ListaContactosProfileEdit>{
  String name = "";
  String nameB = "";

  SolidController _controller = SolidController();

  Widget AddDialog(String foto,String nombre){
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width*0.7,
        height: MediaQuery.of(context).size.height*0.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Contacto Agregado",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*0.028
              ),),
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
                          image: NetworkImage(foto)
                      ),
                    ),
                  ),
                  radius: MediaQuery.of(context).size.height*0.07,
                ),
                Positioned(
                  child: Container(
                    decoration: new BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: MediaQuery.of(context).size.height*0.01,
                      ),
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check,size: 16,color: Colors.white,),
                  ),
                  top: MediaQuery.of(context).size.height*0.105,
                  left: MediaQuery.of(context).size.width*0.21,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(nombre,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*0.028
              ),
              ),
            ),
              ],
            )
      )
        );

  }

  Widget Contacto(String action,String cid){
    return StreamBuilder<User>(
      stream: FirestoreAPI(vid: cid).userData,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (!snapshot.hasData) {
          return Center();
        }
        User user = snapshot.data;
        // print(user.name +' '+user.photoURL);
        return Column(
          children: [
            GestureDetector(
              onTap: (){
                if(action=='see') {
                  print('Contacto a ver: '+cid);
                  Navigator.push(
                      context,
                      PageTransition(
                          child: ListaContactosProfileDetailEdit(cid: cid,),
                          type: PageTransitionType.rightToLeft));
                  setState(() { name=""; });
                }
                if(action=='add') {
                  showDialog(
                    context: context,
                    builder: (context) => AddDialog(user.photoURL,name),
                  );
                  FirestoreAPI().createContactData(user.name+' '+user.lastname, user.photoURL, cid);
                  setState(() { nameB=""; });
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  });
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.12,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0Xff2056a1) ,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: user.photoURL!=null?NetworkImage(user.photoURL): AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                          ),
                        ),
                      ),
                      radius: MediaQuery.of(context).size.height*0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.07,
                    ),
                    Text(user.name+' '+user.lastname,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height*0.02
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color(0XffC4C3C3),
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.001,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
          ],
        );
      },
    );
  }

  Widget Buscador(String action){
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      height: MediaQuery.of(context).size.height*0.05,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
        borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.height*0.1))),
        shape: BoxShape.rectangle,
      ),
      child: TextFormField(
        autocorrect: true,
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
         if(action=='see') setState(() => name = val);
         if(action=='add') setState(() => nameB = val);
        },

      ),
    );
  }

  Widget _settingModalBottomSheet(context){
    showModalBottomSheet(
      enableDrag: true,
        context: context,
        builder: (BuildContext bc){
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Buscador('add'),
              ),
              nameB=="" ? Container(
                  alignment: Alignment.center,
                  height: 300 ,
                  child: Text('Escribe el nombre de la persona que quieres agregar')):
              BuscaAdd()
            ],
          );
        }
    );
  }

  Widget BuscaAdd(){
    return StreamBuilder<QuerySnapshot>(
      stream: (nameB != "" && nameB != null)
          ? FirebaseFirestore.instance
          .collection('usuarios')
          .where("caseSearch", arrayContains: nameB)
          .snapshots()
          : FirebaseFirestore.instance.collection("usuarios").snapshots(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting)
             return Center(child: CircularProgressIndicator());
        else
          if(snapshot.data.docs.length==0) {
            return Container(
                alignment: Alignment.center,
                height: 300,
                child: Text('Busqueda sin resultados'));
          }else {
            return Container(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.48,
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i) {
                  return Contacto('add',snapshot.data.docs[i].data()['uid']);
                },
              ),
            );
        }
      },
    );
    // return Contacto();
  }

  Widget BuscaVer(){
    return StreamBuilder<QuerySnapshot>(
      stream: (name != "" && name != null)
          ? FirebaseFirestore.instance
          .collection('usuarios').doc(uid).collection('contactos')
          .where("caseSearch", arrayContains: name)
          .snapshots()
          : FirebaseFirestore.instance.collection("usuarios").doc(uid).collection('contactos').snapshots(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else
        if(snapshot.data.docs.length==0) {
          return Container(
              alignment: Alignment.center,
              height: 300,
              child: Text('Busqueda sin resultados'));
        }else {
          return Container(
            // color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.48,
            child: ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, i) {
                return Contacto('see',snapshot.data.docs[i].id);
              },
            ),
          );
        }
      },
    );
    // return Contacto();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                        "Lista de contactos",
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
                    Buscador('see')
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                name=="" ?
                StreamBuilder<QuerySnapshot>(
                  stream:  FirebaseFirestore.instance.collection("usuarios").doc(uid).collection('contactos').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    else
                    if(snapshot.data.docs.length==0) {
                      return Container(
                          alignment: Alignment.center,
                          height: 300,
                          child: Text('Aún no tienes contactos Agregados.'));
                    }else {
                      return Container(
                        height: 600,
                        child: ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, i){
                              return Contacto('see',snapshot.data.docs[i].id);
                            }),
                      );
                    }
                  },
                ):BuscaVer()

              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0Xff2056a1),
          child: Icon(Icons.add),
          onPressed: () {
            _settingModalBottomSheet(context);
          }),
    );
  }
}