import 'package:camp/Usuarios/UI/Screens/register.dart';
import 'package:camp/Usuarios/UI/Screens/sidebar.dart';
import 'package:camp/Usuarios/bloc/bloc_user.dart';
import 'package:camp/Usuarios/model/user.dart' as c;
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:page_transition/page_transition.dart';

class FirstView extends StatefulWidget{
  @override
  State createState() {
    return _FirstView();
  }
}
class _FirstView extends State<FirstView>{
  final  FirebaseAuthAPI _auth = FirebaseAuthAPI();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  String error ="";
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }
    Widget _handleCurrentSession() {
      return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //snapshot- data - Object User
          if (!snapshot.hasData || snapshot.hasError) {
            return LoginUser();
          } else {
            print('logeado '+uid);
            return SideBar();
          }
        },
      );
    }
    Widget LoginUser() {
      return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Stack(
                    children: <Widget>
                    [
                      Positioned.fill( //
                        child: Image(
                          image: AssetImage(
                              'assets/images/APP - Pantalla Iniciar Sesion.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/Logo - Camp.png")
                                    ),
                                  ),
                                ),
                                radius: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.09,
                              ),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05,
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.7,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.08,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0Xff2056a1),
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.007,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(((MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.08)))),
                                  shape: BoxShape.rectangle,
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Color(0Xff2056a1),
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.02,
                                  ),
                                  autocorrect: true,
                                  //textAlign: TextAlign.center,
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
                                      fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.02,
                                      color: Color(0Xff2056a1),
                                      //fontFamily:
                                    ),
                                    hintText: '  Correo electrónico',
                                  ),

                                  onChanged: (val) {
                                    setState(() => _email = val);
                                  },

                                ),
                              ),


                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.7,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.08,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0Xff2056a1),
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.007,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular((MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.08))),
                                  shape: BoxShape.rectangle,
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Color(0Xff2056a1),
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.02,
                                  ),
                                  autocorrect: true,
                                  //textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    //contentPadding: EdgeInsets.only(top:10),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      prefixIcon: Icon(Icons.lock,
                                        color: Color(0Xff2056a1),),
                                      hintStyle: TextStyle(
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.02,
                                        color: Color(0Xff2056a1),
                                        //fontFamily:
                                      ),
                                      hintText: '  Contraseña'
                                  ),
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => _password = val);
                                  },
                                ),
                              ),


                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.7,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.06,
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        30.0),
                                  ),
                                  color: Colors.white,
                                  onPressed: () async {
                                    userBloc.signOut();
                                    await _auth.signInWithEmailAndPassword(_email, _password);
                                    //if(_formKey.currentState.validate()){
                                    //await _auth.signInWithEmailAndPassword(_email, _password);}
                                  },
                                  child: Text(
                                    "INICIA SESIÓN",
                                    style: TextStyle(color: Color(0Xff2056a1),
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.03,
                                        fontFamily: "BAHNSCHRIFT"),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.04,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  GestureDetector(
                                    onTap: () {
                                      //Navigator.of(context).pushNamed(ForgotPasswordRoute);
                                    },
                                    child: Image(
                                        height: 35,
                                        image: AssetImage(
                                          'assets/images/facebook.png',)
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      userBloc.signOut();
                                      userBloc.signIn().then((User user) {
                                        c.User nuevouser = new c.User(
                                            uid: user.uid,
                                            name: user.displayName,
                                            email: user.email,
                                            photoURL: user.photoURL);
                                        FirestoreAPI().createUserData(nuevouser);
                                        // print(
                                        //     "El usuario es ${user.displayName}");
                                      });
                                    },
                                    child: Image(
                                        height: 35,
                                        image: AssetImage(
                                          'assets/images/google-plus.png',)
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.17,
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.04,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      //Navigator.of(context).pushNamed(ForgotPasswordRoute);
                                    },
                                    child: Container(
                                      child: Text(
                                        "Olvidaste tu contraseña?",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.02,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, PageTransition(
                                          child: RegisterView(),
                                          type: PageTransitionType
                                              .rightToLeft));
                                    },
                                    child: Container(
                                      child: Text(
                                        "Regístrate",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.02,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ),
                      )

                    ]
                )
            )
        ),
      );
    }
  }

