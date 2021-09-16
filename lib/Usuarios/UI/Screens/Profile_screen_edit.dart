import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreenEdit extends StatefulWidget{
  @override
  State createState() {
    return _ProfileScreenEdit();
  }
}
class _ProfileScreenEdit extends State<ProfileScreenEdit>{
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
      body: SingleChildScrollView(
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
                  GestureDetector(
                    onTap: (){
                      //Navigator.push(context, PageTransition(child: RegisterView(), type: PageTransitionType.rightToLeft));
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,

                      child: Text(
                        "Perfil",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0Xff2056a1),
                            fontSize: MediaQuery.of(context).size.height*0.03,
                            fontWeight: FontWeight.bold),
                      ),
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
                      "Nombre",
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
                        autofocus: true,
                        autocorrect: true,
                        //textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          fillColor: Colors.white,
                          hintText: "Maria Claudia",
                          hintStyle: TextStyle(
                             fontSize: MediaQuery.of(context).size.height*0.02,
                            //fontFamily:
                          ),
                        ),

                        validator: (input)=> input.isEmpty ? 'Ingresa un nombre válido' : null,
                        onChanged: (val){
                          //setState(() => _email = val);
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
                      "Apellido",
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
                    autofocus: true,
                    autocorrect: true,
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      fillColor: Colors.white,
                      hintText: "Arce Robles",
                      hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.02,
                        //fontFamily:
                      ),
                    ),

                    validator: (input)=> input.isEmpty ? 'Ingresa un Apellido válido' : null,
                    onChanged: (val){
                      //setState(() => _email = val);
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
                      "Correo Electrónico",
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
                    autofocus: true,
                    autocorrect: true,
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      fillColor: Colors.white,
                      hintText: "prueba@gmail.com",
                      hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.02,
                        //fontFamily:
                      ),
                    ),

                    validator: (input)=> input.isEmpty ? 'Ingresa un correo válido' : null,
                    onChanged: (val){
                      //setState(() => _email = val);
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

                      // Navigator.push(context, PageTransition(child: Register_part1_view(), type: PageTransitionType.rightToLeft));


                      /*if(_formKey.currentState.validate()){
                          await _auth.signInWithEmailAndPassword(_email, _password);
                        }*/
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.01,
                  ),
                  GestureDetector(
                    onTap: (){

                      // Navigator.push(context, PageTransition(child: Register_part1_view(), type: PageTransitionType.rightToLeft));


                      /*if(_formKey.currentState.validate()){
                          await _auth.signInWithEmailAndPassword(_email, _password);
                        }*/
                    },
                    child: Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.05,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle
                        ),
                        child: Center(
                          child: Text("Profesional",
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
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                  ),
                  GestureDetector(
                    onTap: (){
                      //Navigator.push(context, PageTransition(child: RegisterView(), type: PageTransitionType.rightToLeft));
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,

                      child: Text(
                        "Actualizar contraseña",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0Xff2056a1),
                            fontSize: MediaQuery.of(context).size.height*0.025,
                            fontWeight: FontWeight.bold),
                      ),
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
                      "Contraseña actual",
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
                    autofocus: true,
                    autocorrect: true,
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      fillColor: Colors.white,
                      hintText: "***********",
                      hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.02,
                        //fontFamily:
                      ),
                    ),
                    obscureText: true,

                    validator: (input)=> input.isEmpty ? 'Ingresa un correo válido' : null,
                    onChanged: (val){
                      //setState(() => _email = val);
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
                      "Nueva contraseña",
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
                    autofocus: true,
                    autocorrect: true,
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      fillColor: Colors.white,
                      hintText: "***********",
                      hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.02,
                        //fontFamily:
                      ),
                    ),
                    obscureText: true,

                    validator: (input)=> input.isEmpty ? 'Ingresa un correo válido' : null,
                    onChanged: (val){
                      //setState(() => _email = val);
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

                      // Navigator.push(context, PageTransition(child: Register_part1_view(), type: PageTransitionType.rightToLeft));


                      /*if(_formKey.currentState.validate()){
                          await _auth.signInWithEmailAndPassword(_email, _password);
                        }*/
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
      )
    );
  }}