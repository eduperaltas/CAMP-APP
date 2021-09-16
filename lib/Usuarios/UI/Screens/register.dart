import 'package:camp/Usuarios/bloc/bloc_user.dart';
import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:page_transition/page_transition.dart';

import 'Login.dart';
import 'Register_part_1.dart';


class RegisterView extends StatefulWidget{
  @override
  State createState() {
    return _RegisterView();
  }
}
class _RegisterView extends State<RegisterView>{

  bool valuefirst = false;
  bool valuesecond = false;
  final  FirebaseAuthAPI _auth = FirebaseAuthAPI();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _uid,_email, _password,_name,_lastname,_telfono;
  String error ="";
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }
  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if(!snapshot.hasData || snapshot.hasError) {
          return SignUp();
        } else {
          User newuser = User(uid: _uid, name: _name ,lastname: _lastname, email: _email,telefono: _telfono);
          return Register_part1_view(user: newuser);
        }
      },
    );

  }
    // TODO: implement build
    Widget SignUp() {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child:Stack(
                  children: <Widget>
                  [
                    Positioned.fill(  //
                      child: Image(
                        image: AssetImage('assets/images/APP - Pantalla Crear Cuenta.png'),
                        fit : BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    "CREAR ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context).size.height*0.04,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "CUENTA",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context).size.height*0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.1,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              height: MediaQuery.of(context).size.height*0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0Xff2056a1),
                                  width: MediaQuery.of(context).size.height*0.007,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.height*0.08))),
                                shape: BoxShape.rectangle,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Color(0Xff2056a1),
                                  fontSize: MediaQuery.of(context).size.height*0.02,
                                ),
                                decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.only(top:10),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  prefixIcon: Icon(Icons.person,
                                    color: Color(0Xff2056a1),),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height*0.02,
                                    color: Color(0Xff2056a1),
                                    //fontFamily:
                                  ),
                                  hintText: '  NOMBRE',
                                ),

                                onChanged: (val){
                                  setState(() => _name = val);
                                },

                              ),
                            ),


                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.03,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              height: MediaQuery.of(context).size.height*0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0Xff2056a1),
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.height*0.08))),
                                shape: BoxShape.rectangle,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Color(0Xff2056a1),
                                  fontSize: MediaQuery.of(context).size.height*0.02,
                                ),
                                decoration: InputDecoration(
                                    //contentPadding: EdgeInsets.only(top:10),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    prefixIcon: Icon(Icons.person,
                                      color: Color(0Xff2056a1),),
                                    hintStyle: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height*0.02,
                                      color: Color(0Xff2056a1),
                                      //fontFamily:
                                    ),
                                    hintText: '  APELLIDO'
                                ),
                                obscureText: false,
                                onChanged: (val){
                                  setState(() => _lastname = val);
                                },
                              ),
                            ),

                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.03,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              height: MediaQuery.of(context).size.height*0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0Xff2056a1),
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.height*0.08))),
                                shape: BoxShape.rectangle,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Color(0Xff2056a1),
                                  fontSize: MediaQuery.of(context).size.height*0.02,
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    prefixIcon: Icon(Icons.phone,
                                      color: Color(0Xff2056a1),),
                                    hintStyle: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height*0.02,
                                      color: Color(0Xff2056a1),
                                      //fontFamily:
                                    ),
                                    hintText: '  TELEFONO'
                                ),
                                obscureText: false,
                                onChanged: (val){
                                  setState(() => _telfono = val);
                                },
                              ),
                            ),


                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.03,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              height: MediaQuery.of(context).size.height*0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0Xff2056a1),
                                  width: MediaQuery.of(context).size.height*0.007,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.height*0.08))),
                                shape: BoxShape.rectangle,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Color(0Xff2056a1),
                                  fontSize: MediaQuery.of(context).size.height*0.02,
                                ),
                                decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.only(top:10),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  prefixIcon: Icon(Icons.mail,
                                    color: Color(0Xff2056a1),),
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height*0.02,
                                    color: Color(0Xff2056a1),
                                    //fontFamily:
                                  ),
                                  hintText: '  Correo electrónico',
                                ),


                                onChanged: (val){
                                  setState(() => _email = val);
                                },

                              ),
                            ),


                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.03,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              height: MediaQuery.of(context).size.height*0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0Xff2056a1),
                                  width: MediaQuery.of(context).size.height*0.007,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.height*0.08))),
                                shape: BoxShape.rectangle,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Color(0Xff2056a1),
                                  fontSize: MediaQuery.of(context).size.height*0.02,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    prefixIcon: Icon(Icons.lock,
                                      color: Color(0Xff2056a1),),
                                    hintStyle: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height*0.02,
                                      color: Color(0Xff2056a1),
                                      //fontFamily:
                                    ),
                                    hintText: '  Contraseña',
                                    //labelText: '  Contraseña'
                                ),
                                obscureText: true,

                                onChanged: (val){
                                  setState(() => _password = val);
                                },
                              ),
                            ),



                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.03,
                            ),
                            GestureDetector(
                                onTap: () async {
                                  userBloc.signOut();
                                  var result = await _auth.registerWithEmailAndPassword(_email, _password);
                                  setState(() {
                                    _uid= result.uid;
                                  });
                                  },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.height*0.1,
                                      height: MediaQuery.of(context).size.height*0.1,
                                      decoration: BoxDecoration(
                                          color: Color(0Xff2056a1),
                                          shape: BoxShape.circle
                                      ),
                                      child: FittedBox(
                                        child: Icon(Icons.arrow_forward,
                                          size: MediaQuery.of(context).size.height*0.08,
                                          color: Colors.white,),
                                      ),
                                    ),

                                  ],
                                )
                            ),
                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Color(0Xff2056a1),
                                  value: this.valuefirst,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuefirst = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.height*0.01,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, PageTransition(child: FirstView(), type: PageTransitionType.rightToLeft));
                                  },
                                  child: Container(
                                    child: Text(
                                      "Acepto los términos y condiciones",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.height*0.02,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.01,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, PageTransition(child: FirstView(), type: PageTransitionType.rightToLeft));
                              },
                              child: Container(
                                child: Text(
                                  "Inicia Sesión",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.height*0.02,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),

                      ),
                    )

                  ]
              )
          ),
        )
    );
  }


}