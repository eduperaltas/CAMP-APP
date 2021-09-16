import 'package:camp/Usuarios/model/Cupon.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'CuponeraDetail.dart';
class CuponeraScreenView extends StatefulWidget with NavigationStates{
  @override
  State createState() {
    return _CuponeraScreenView();
  }
}
class _CuponeraScreenView extends State<CuponeraScreenView>{
  var selectedCurrency;
  String sd="Selecciona una categoria";
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  String _Titabuscar,_categoria;

  Widget Contenido(){
    return StreamBuilder(
      stream: (_Titabuscar != "" && _Titabuscar != null)
          ? FirestoreAPI(search: 1,Txtabuscar: _Titabuscar).cuponesData
          :(_categoria!=null)
          ?FirestoreAPI(filtro: _categoria).cuponesData
          : FirestoreAPI(search: 0).cuponesData,
      builder: (context, snapshot) {
        List<Cupon>lstCupones=snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else
        if(lstCupones.length==0) {
          return Container(
              alignment: Alignment.center,
              height: 300,
              child: Text('Busqueda sin resultados'));
        }else {
          return Container(
            height: MediaQuery.of(context).size.height * 0.77,
            child: ListView.builder(
                itemCount: lstCupones.length,
                itemBuilder: (context, i){
                  return CardCupon(lstCupones[i]);
                }
            ),
          );
        }
      },
    );
    // return Contacto();
  }

  Widget CardCupon(Cupon cup){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, PageTransition(child: CuponeraDetailScreenView(cup: cup,), type: PageTransitionType.rightToLeft));
          },
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.1,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(cup.portada)
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),
      ],
    );
  }

  Widget categorias(){
    return Form(
      key: _formKeyValue,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("cupones")
              .doc('cats').collection('categorias').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Container(child: Text("Cargando..."));
            else {
              List<DropdownMenuItem> currencyItems = [];
              print('cats encontradas:${snapshot.data.docs.length}');
              for (int i = 0; i < snapshot.data.docs.length; i++) {
                DocumentSnapshot snap = snapshot.data.docs[i];
                currencyItems.add(
                  DropdownMenuItem(
                    child: Text(
                      snap.id,
                      style: TextStyle(color: Color(0Xff2056a1)),
                    ),
                    value: "${snap.id}",
                  ),
                );
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: DropdownButton(
                      items: currencyItems,
                      onChanged: (currencyValue) {
                        setState(() {
                          selectedCurrency = currencyValue;
                          _categoria = currencyValue;
                        });
                      },
                      value: selectedCurrency,
                      isExpanded: false,
                      hint: new Text(
                        sd,
                        style: TextStyle(color: Color(0Xff2056a1)),
                      ),
                    ),
                  ),

                ],
              );
            }
          }),
    );
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
              "CUPONERA",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20
              ),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
        backgroundColor:Color(0Xff2056a1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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

                    validator: (input)=> input.isEmpty ? 'Ingresa un Email válido' : null,
                    onChanged: (val){
                      setState(() => selectedCurrency = null);
                      setState(() => _Titabuscar = val);
                    },

                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.015,
            ),
            categorias(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.015,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Contenido()
            ),

          ],
        ),
      ),

    );
  }}