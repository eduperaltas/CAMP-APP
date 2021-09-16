import 'package:camp/Usuarios/model/Profesional.dart';
import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileProfesionalScreenEdit extends StatefulWidget{
  @override
  State createState() {
    return _ProfileProfesionalScreenEdit();
  }
}
class _ProfileProfesionalScreenEdit extends State<ProfileProfesionalScreenEdit>{
  String _emp,_carg,_telf,_ccorp,_res,_exp;
  User prof;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        body: StreamBuilder(
            stream: FirestoreAPI().userData,
          builder: (context, snapshot) {
              User misdatos = snapshot.data;
              if(!snapshot.hasData){
                return Center(
                  child: Container(child: CircularProgressIndicator(color: Color(0Xff2056a1),)),
                );
              }
            return SingleChildScrollView(
              child: Form(
                //key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                            "Profesional",
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
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.075,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Empresa",
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
                      height: MediaQuery.of(context).size.height*0.06,
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
                          initialValue: misdatos.empresa!=null?misdatos.empresa:'',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Empresa",
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.02,
                            ),
                          ),
                          validator: (input)=> input.isEmpty ? 'Ingresa un nombre válido' : null,
                          onChanged: (val){
                            setState(() => _emp = val);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
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
                            "Cargo",
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
                      height: MediaQuery.of(context).size.height*0.06,
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
                          initialValue: misdatos.cargo!=null?misdatos.cargo:'',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Cargo",
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.02,
                              //fontFamily:
                            ),
                          ),

                          validator: (input)=> input.isEmpty ? 'Ingresa un Cargo válido' : null,
                          onChanged: (val){
                            setState(() => _carg = val);
                          },

                        ),
                      ),
                    ),

                    SizedBox(
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
                            "Teléfono",
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
                      height: MediaQuery.of(context).size.height*0.06,
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
                          keyboardType: TextInputType.phone,
                          initialValue: misdatos.telefono!=null?misdatos.telefono:'',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Teléfono",
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.02,
                              //fontFamily:
                            ),
                          ),

                          validator: (input)=> input.isEmpty ? 'Ingresa un telefono válido' : null,
                          onChanged: (val){
                            setState(() => _telf = val);
                          },

                        ),
                      ),
                    ),

                    SizedBox(
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
                            "Correo Corporativo",
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
                      height: MediaQuery.of(context).size.height*0.06,
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
                          initialValue: misdatos.correoCorp!=null?misdatos.correoCorp:'',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Correo Corporativo",
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.02,
                              //fontFamily:
                            ),
                          ),

                          validator: (input)=> input.isEmpty ? 'Ingresa un Cargo válido' : null,
                          onChanged: (val){
                            setState(() => _ccorp = val);
                          },

                        ),
                      ),
                    ),
                    SizedBox(
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
                            "Resumen",
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
                      height: MediaQuery.of(context).size.height*0.3,
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
                          initialValue: misdatos.Resumen!=null?misdatos.Resumen:'',
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
                          maxLines: 20,
                          validator: (input)=> input.isEmpty ? 'Ingresa un resumen válido' : null,
                          onChanged: (val){
                            setState(() => _res = val);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
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
                            "Experiencia",
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
                      height: MediaQuery.of(context).size.height*0.3,
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
                          initialValue: misdatos.Experiencia!=null?misdatos.Experiencia:'',
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
                          maxLines: 20,
                          validator: (input)=> input.isEmpty ? 'Ingresa una Experiencia válido' : null,
                          onChanged: (val){
                            setState(() => _exp = val);
                          },

                        ),
                      ),
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
                            if(_emp!=null && _carg!=null&& _telf!=null&& _ccorp!=null&& _res!=null&& _exp!=null)
                              {
                                print('dentro');
                                prof = new User(empresa: _emp,cargo: _carg,
                                    telefono: _telf,correoCorp: _ccorp,Resumen: _res,Experiencia: _exp);
                                FirestoreAPI().createProfesionalData(prof);
                              }

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
                                child: Text("Guardar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: MediaQuery.of(context).size.height*0.02
                                  ),),
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),
                  ],
                ),
              ),
            );
          }
        )
    );
  }}