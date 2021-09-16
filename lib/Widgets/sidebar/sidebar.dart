import 'dart:async';

import 'package:camp/Usuarios/UI/Screens/Login.dart';
import 'package:camp/Usuarios/bloc/bloc_user.dart';
import 'package:camp/Usuarios/model/user.dart';
import 'package:camp/Usuarios/repository/Firestore_api.dart';
import 'package:camp/Usuarios/repository/firebase_auth_api.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'navigation_bloc.dart';
import 'menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
  UserBloc userBloc;
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  UserBloc userBloc;
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }



  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  Widget sideBar(BuildContext context, User user){
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Color(0Xff2056a1),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.1,
                          ),
                          ListTile(
                            title: Text(
                              user.name,
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              user.email,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: user.photoURL!=null?NetworkImage(user.photoURL): AssetImage("assets/images/APP - Pantalla Foto Perfil Referencial.png")
                                  ),
                                ),
                              ),
                              radius: MediaQuery.of(context).size.width*0.08,
                            ),
                          ),
                          Divider(
                            height: 50,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),
                          MenuItem(
                            icon: Icons.person,
                            title:"Perfil",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ProfileScreenClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.home,
                            title: "Home",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomeScreenClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.create_new_folder_sharp,
                            title: "Mural",
                            onTap: ()  {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MuralScreenClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.event,
                            title: "Talleres/Eventos",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.TalleresEventosScreenClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.account_balance,
                            title: "Cursos",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.CursosScreenClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.store,
                            title: "Compras Online",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ComprasOnlineScreenClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.airplane_ticket,
                            title: "Cuponera",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.CuponeraScreenClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.book,
                            title: "Biblioteca",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.BibliotecaScreenClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.business_sharp,
                            title: "Quiénes Somos",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.QuienesSomosScreenClickedEvent);
                            },
                          ),
                          Divider(
                            height: 10,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.3),
                            indent: 32,
                            endIndent: 32,
                          ),
                          MenuItem(
                            icon: Icons.exit_to_app,
                            title: "Logout",
                            onTap: () {
                              FirebaseAuthAPI().signOut();
                              Navigator.push(
                                  context,
                                  PageTransition(child: FirstView(), type: PageTransitionType.rightToLeft));

                            },
                          ),
                        ],
                      ),
                    )
                ),

              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 45,
                      height: 110,
                      color: Color(0Xff2056a1),
                      alignment: Alignment.center,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // userBloc = BlocProvider;
    return StreamBuilder<User>(
      stream: FirestoreAPI().userData,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (!snapshot.hasData) {
          return Center();
          // <---- no return here
        }
        User user = snapshot.data;
        name=user.name;
        imageUrl=user.photoURL;
        return sideBar(context,user);
      },
    );

  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
