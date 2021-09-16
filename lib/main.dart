import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Usuarios/UI/Screens/Login.dart';
import 'Usuarios/bloc/bloc_user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return BlocProvider<UserBloc>(
        bloc: UserBloc(),

        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('es')
          ],
          debugShowCheckedModeBanner: false,
          home: FirstView(),
        ));
  }
}