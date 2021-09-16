import 'package:camp/Usuarios/model/Publicacion.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MuralScreenView extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _MuralScreenView();
  }
}
class _MuralScreenView extends State<MuralScreenView>{
  String _Titabuscar;
  
 Widget cardPublicacion(Publicacion p){
   return Column(
     children: [
       Row(
         children: [
           SizedBox(
             width: MediaQuery.of(context).size.width*0.1,
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 color: Color(0xffededed),
                 width: MediaQuery.of(context).size.width*0.8,
                 height: MediaQuery.of(context).size.height*0.08,
                 child: Row(
                   //crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     CircleAvatar(
                       backgroundColor: Color(0Xff2056a1) ,
                       child: Container(
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           image: DecorationImage(
                               fit: BoxFit.cover,
                               image:NetworkImage(p.Autorfoto)
                           ),
                         ),
                       ),
                       radius:  MediaQuery.of(context).size.height*0.03,
                     ),
                     Text(p.Autorname,
                       style: TextStyle(
                           fontWeight: FontWeight.w600,
                           fontSize: MediaQuery.of(context).size.height*0.02
                       ),
                     ),
                     Column(
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(p.fecha.substring(0,10),style: TextStyle(
                             color: Color(0xffababab),
                             fontWeight: FontWeight.w600,
                             fontSize: MediaQuery.of(context).size.height*0.02
                         ),),
                         Text(p.fecha.substring(10,16),style: TextStyle(
                             color: Color(0xffababab),
                             fontWeight: FontWeight.w600,
                             fontSize: MediaQuery.of(context).size.height*0.02
                         ),),
                       ],
                     ),
                     Icon(Icons.add_circle,
                       color: Colors.green,size: MediaQuery.of(context).size.height*0.025,)
                   ],
                 ),
               ),
               Container(
                 color: Colors.grey,
                 height:MediaQuery.of(context).size.height*0.01,
                 width: MediaQuery.of(context).size.width*0.8,
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height*0.02,
               ),
               Container(
                 width: MediaQuery.of(context).size.width*0.8,
                 height: MediaQuery.of(context).size.height*0.2,
                 decoration: BoxDecoration(
                   shape: BoxShape.rectangle,
                   image: DecorationImage(
                       fit: BoxFit.scaleDown,
                       image: NetworkImage(p.portada)
                   ),
                 ),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height*0.015,
               ),
               Container(
                 width: MediaQuery.of(context).size.width*0.8,
                 height: MediaQuery.of(context).size.height*0.065,
                 child: Text(p.titulo,
                   textAlign: TextAlign.justify,
                   style: TextStyle(
                       color: Colors.black,
                       fontSize: MediaQuery.of(context).size.height*0.03,
                       fontWeight: FontWeight.bold,
                   ),
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height*0.015,
               ),
               Container(
                 width: MediaQuery.of(context).size.width*0.8,
                 // height: MediaQuery.of(context).size.height*0.3,
                 child: Text(p.texto,
                   textAlign: TextAlign.justify,
                   style: TextStyle(
                       color: Colors.black,
                       fontSize: MediaQuery.of(context).size.height*0.018,
                       height: 1.5
                   ),
                   maxLines: 4,
                   overflow: TextOverflow.ellipsis,
                 ),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height*0.015,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(
                     width: MediaQuery.of(context).size.width*0.5,
                   ),
                   Container(
                     //alignment: Alignment.centerRight,
                     child: Text("Ver más",style: TextStyle(
                         color: Color(0Xff2056a1),
                         fontSize: MediaQuery.of(context).size.height*0.025,
                         fontWeight: FontWeight.w900
                     ),),
                   ),

                 ],
               ),
             ],
           )
         ],
       ),
       SizedBox(
         height: MediaQuery.of(context).size.height*0.03,
       ),
     ],
   );
 }

 Widget BuscaPub(){
    return StreamBuilder<QuerySnapshot>(
      stream: (_Titabuscar != "" && _Titabuscar != null)
          ? FirebaseFirestore.instance
          .collection('mural')
          .where("caseSearch", arrayContains: _Titabuscar)
          .where('Estado',isEqualTo: 'Aprobado')
          .snapshots()
          : FirebaseFirestore.instance.collection('mural').where('Estado',isEqualTo: 'Aprobado').snapshots(),
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
            height: MediaQuery.of(context).size.height * 0.77,
            child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i){
                  return cardPublicacion(new Publicacion(uid: snapshot.data.docs[i].id,
                      Autorname: snapshot.data.docs[i].data()['autor'], Autorfoto: snapshot.data.docs[i].data()['fotoAutor'],
                      titulo: snapshot.data.docs[i].data()['Titulo'], texto: snapshot.data.docs[i].data()['Texto'],
                      fecha: snapshot.data.docs[i].data()['Fecha'], estado: snapshot.data.docs[i].data()['Estado'],
                      img1: snapshot.data.docs[i].data()['Img1'],img2: snapshot.data.docs[i].data()['Img2'],
                      portada: snapshot.data.docs[i].data()['Portada']));
                }
            ),
          );
        }
      },
    );
    // return Contacto();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                      setState(() => _Titabuscar = val);
                    },

                  ),
                ),
              ],
            ),
            SizedBox(
                  height: MediaQuery.of(context).size.height*0.04,
                ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: double.parse((400*2).toString()),
              child: BuscaPub(),
            ),

          ],
        ),
      ),

    );
  }}