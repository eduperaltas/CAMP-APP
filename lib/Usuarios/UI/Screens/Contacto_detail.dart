import 'package:camp/Usuarios/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactoDetail extends StatefulWidget{
  User u;
  @override
  State createState() {
    return _ContactoDetail();
  }
  ContactoDetail({this.u});
}
class _ContactoDetail extends State<ContactoDetail>{
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
        child: Column(
          children: [
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
                      "Contacto",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(this.widget.u.photoURL),
                  radius: MediaQuery.of(context).size.width*0.14,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.03,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(
                        this.widget.u.name, style:
                      TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height*0.025
                      ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.006,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.025,
                      child: Text("Empresa: ${this.widget.u.empresa}", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height*0.016
                      ),),
                    ),
                    Container(

                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.025,
                      child: Text("Cargo: ${this.widget.u.cargo}", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height*0.016
                      ),),
                    ),
                    Container(

                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.025,
                      child: Text("Teléfono: ${this.widget.u.telefono}", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height*0.016
                      ),),
                    ),
                    Container(

                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.04,
                      child: Text("Correo: "+this.widget.u.email, style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize:MediaQuery.of(context).size.height*0.016
                      ),),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Container(
              color: Color(0XffC4C3C3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.001,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Container(
                  child: Text("Resumen", style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height*0.02
                  ),),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: Text(this.widget.u.Resumen!=''?this.widget.u.Resumen:'${this.widget.u.name} aún no añadio su resumen', style:
              TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height*0.018
              ),textAlign: TextAlign.justify,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Container(
              color: Color(0XffC4C3C3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.001,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                ),
                Container(
                  child: Text("Experciencia", style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height*0.02
                  ),),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: Text(this.widget.u.Experiencia!=''?this.widget.u.Experiencia:'${this.widget.u.name} aún no añadio su experiencia', style:
              TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height*0.018
              ),textAlign: TextAlign.justify,),
            ),


          ],
        ),
      ),

    );
  }
}