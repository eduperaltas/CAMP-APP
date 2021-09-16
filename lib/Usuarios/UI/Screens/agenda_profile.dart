
import 'package:camp/Usuarios/model/Calendario.dart';
import 'package:camp/Usuarios/model/Evento.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import 'Talleres_Eventos_Detail.dart';
class AgendaProfileEdit extends StatefulWidget {
  @override
  _AgendaProfileEdit createState() => _AgendaProfileEdit();
}

class _AgendaProfileEdit extends State<AgendaProfileEdit> {
  DateTime selectedDay= DateTime.now();
  List selectedEvent = [];


  final Map<DateTime, List<CleanCalendarEvent>> events = {

  };

  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState()  {
    // TODO: implement initState
    // _initData();
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  Widget evento(int i, String titulo, String time,String id){
    i++;
    return GestureDetector(
      onTap: (){ print(id); },
      child: Container(
        height:MediaQuery.of(context).size.height*0.06,
        decoration: BoxDecoration(
            color: Color(0xffdddddd),
            shape: BoxShape.rectangle
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("$i",style: TextStyle(
                color: Color(0xffababab),
                fontWeight: FontWeight.w900,
                fontSize: MediaQuery.of(context).size.height*0.02
            ),),
            Text(titulo,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: MediaQuery.of(context).size.height*0.02
            ),),
            Text(time,style: TextStyle(
                color: Color(0xffababab),
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height*0.02
            ),),
            StreamBuilder<Object>(
              stream: FirestoreAPI(vid: id).eventoData,
              builder: (context, snapshot) {
                Evento e=snapshot.data;
                if(!snapshot.hasData)
                  return Container(
                    width: MediaQuery.of(context).size.height*0.04,
                    height: MediaQuery.of(context).size.height*0.04,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.height*0.01,
                          height: MediaQuery.of(context).size.height*0.01,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height*0.01,
                          height: MediaQuery.of(context).size.height*0.01,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height*0.01,
                          height: MediaQuery.of(context).size.height*0.01,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle
                          ),
                        ),
                      ],
                    ),
                  );
                else
                  return GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: TalleresEventosDetailScreenView(event: e,), type: PageTransitionType.rightToLeft));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height*0.04,
                    height: MediaQuery.of(context).size.height*0.04,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.height*0.01,
                          height: MediaQuery.of(context).size.height*0.01,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height*0.01,
                          height: MediaQuery.of(context).size.height*0.01,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height*0.01,
                          height: MediaQuery.of(context).size.height*0.01,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );

  }

  Widget EventosxDia(){
    String fecha = DateFormat('dd/MM/yyyy').format(selectedDay);
    print('date: '+fecha);
    return StreamBuilder(
        stream: FirestoreAPI(fecha: fecha).calendarioData,
        builder: (context, snapshot) {
          List<Calendario> lstEventos = snapshot.data;
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                    child: CircularProgressIndicator(color: Color(0Xff2056a1),)),
              );
            }
            else {
              if(lstEventos.length>0){
                return Expanded(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lstEventos.length,
                      itemBuilder: (context, i){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                          child: evento(i,lstEventos[i].titulo,lstEventos[i].fecha,lstEventos[i].id),
                        );
                      }
                  ),
                );
              }
              else
                return Container(padding: EdgeInsets.fromLTRB(0, 40, 0, 0),child: Center(child: Text('No hay eventos para hoy.'),),);
            }
        }
    );
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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Agenda",
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
            Container(
              height:  MediaQuery.of(context).size.height,
              child: Calendar(
                locale: 'es_PE',
                startOnMonday: true,
                selectedColor: Color(0Xff2056a1),
                todayColor: Colors.red,
                eventColor: Colors.green,
                eventDoneColor: Colors.amber,
                bottomBarColor: Color(0Xff2056a1),
                onRangeSelected: (range){
                  print('Selected Day ${range.from}, ${range.to}');
                },
                onDateSelected: (date){
                  return _handleData(date);
                },
                events: events,
                eventListBuilder: (BuildContext contex,events){
                  return EventosxDia();
                  // return evento(1, 'event.summary', '20-20-2021');
                },
                // isExpanded: true,
                dayOfWeekStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height*0.025,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
                bottomBarTextStyle: TextStyle(
                  color: Colors.white,
                ),
                hideBottomBar: false,
                isExpandable: true,
                hideArrows: false,
                weekDays: ['Lun','Mar','Mie','Jue','Vie','Sab','Dom'],
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width*1,
            //   height: MediaQuery.of(context).size.height*0.005,
            //   color: Colors.grey,
            // ),


          ],
        ),
      )
    );
  }
}