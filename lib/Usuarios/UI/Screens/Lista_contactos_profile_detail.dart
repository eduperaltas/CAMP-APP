import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Contacto_detail.dart';

class ListaContactosProfileDetailEdit extends StatefulWidget{
  String cid;
  @override
  State createState() {
    return _ListaContactosProfileDetailEdit();
  }
  ListaContactosProfileDetailEdit({this.cid});
}
class _ListaContactosProfileDetailEdit extends State<ListaContactosProfileDetailEdit>{
  @override
  Widget build(BuildContext context) {
    print('Contacto a ver info b: '+this.widget.cid);
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
        child: StreamBuilder<User>(
          stream: FirestoreAPI(vid: this.widget.cid).userData,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
              // <---- no return here
            }
            User user = snapshot.data;
            return body(context,user);
          },
        )
    )
    );

  }

  Widget body(BuildContext context,User u){
    return Column(
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
                  "Contactos",
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
            height: MediaQuery.of(context).size.height*0.05,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0Xff2056a1),
                  width:MediaQuery.of(context).size.height*0.003,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: u.photoURL!=null?NetworkImage(u.photoURL): AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                ),
              ),
            ),
            radius: MediaQuery.of(context).size.height*0.1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          Text(
            u.name+' '+u.lastname, style:
          TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.height*0.03
          ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Text(
            u.email, style:
          TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.height*0.02
          ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.08,
          ),
          u.empresa!=''?Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text("Empresa: ${u.empresa}", style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height*0.02
            ),),
          ):Container(),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          u.cargo!=''?Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text("Cargo: ${u.cargo}", style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height*0.02
            ),),
          ):Container(),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(child: ContactoDetail(u: u,), type: PageTransitionType.rightToLeft));
            },
            child: Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width*0.45,
                height: MediaQuery.of(context).size.height*0.05,
                decoration: BoxDecoration(
                    color: Color(0Xff2056a1),
                    shape: BoxShape.rectangle
                ),
                child: Center(
                  child: Text("Más Información",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height*0.02
                    ),),
                )
            ),
          ),
        ]
    );
  }

}