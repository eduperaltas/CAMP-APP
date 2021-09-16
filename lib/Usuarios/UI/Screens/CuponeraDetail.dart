import 'package:camp/Usuarios/model/Cupon.dart';
import 'package:camp/Widgets/sidebar/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class CuponeraDetailScreenView extends StatefulWidget with NavigationStates{
  Cupon cup;
  CuponeraDetailScreenView({this.cup});
  @override
  State createState() {
    return _CuponeraDetailScreenView();
  }
}
class _CuponeraDetailScreenView extends State<CuponeraDetailScreenView>{

  @override
  Widget build(BuildContext context) {
    Cupon cup=this.widget.cup;
    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }

    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width*1,
            //       height: MediaQuery.of(context).size.height*0.08,
            //       decoration: BoxDecoration(
            //           color: Colors.grey
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width*0.7,
            //       height: MediaQuery.of(context).size.height*0.05,
            //       decoration: BoxDecoration(
            //         color: Color(0Xff6c6c6c),
            //         border: Border.all(
            //           color: Color(0Xff6c6c6c),
            //           width: 5,
            //         ),
            //         borderRadius: BorderRadius.all(Radius.circular((20.0))),
            //         shape: BoxShape.rectangle,
            //       ),
            //       child: TextFormField(
            //         autocorrect: true,
            //         decoration: InputDecoration(
            //           border: InputBorder.none,
            //           focusedBorder: InputBorder.none,
            //           enabledBorder: InputBorder.none,
            //           errorBorder: InputBorder.none,
            //           disabledBorder: InputBorder.none,
            //           prefixIcon: Icon(Icons.search,
            //             color: Colors.white,),
            //           fillColor: Colors.white,
            //           labelStyle: TextStyle(
            //             color: Color(0Xff6c6c6c),
            //             //fontFamily:
            //           ),
            //         ),
            //
            //         validator: (input)=> input.isEmpty ? 'Ingresa un Email válido' : null,
            //         onChanged: (val){
            //           //setState(() => _email = val);
            //         },
            //
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.22,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(cup.portada)
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(cup.titulo+' ',style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.height*0.018
                      ),),
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Desde: ${cup.fechaini}",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 11
                          ),),
                          Text("Hasta: ${cup.fechafin}",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 11
                          ),),
                        ],
                      )
                  ),

                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: Text(cup.texto,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height*0.018
                ),),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.03,
                  width: MediaQuery.of(context).size.width*0.2,
                  child: Text("Ubicación",style: TextStyle(
                    fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.height*0.018
                  ),),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: (){
                    _launchURL(cup.urldirec);
                  },
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0Xff2056a1)),
                      children: <TextSpan>[
                        TextSpan(
                            text: cup.direccion,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                fontSize: 11
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: GestureDetector(
                onTap: ()  {
                  _launchURL(cup.descarga);
                },
                child: Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: BoxDecoration(
                        color: Color(0Xff2056a1),
                        shape: BoxShape.rectangle
                    ),
                    child: Center(
                      child: Text("Descargar Cupón",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.height*0.02
                        ),),
                    )
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),

          ],
        ),
      ),

    );
  }}