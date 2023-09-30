import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_applinews/blocmangment/newscubit.dart';
import 'package:flutter_applinews/blocmangment/newsstats.dart';
import 'package:flutter_applinews/cashhelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocmangment/myhome.dart';
import 'blocmangment/screenbottom/dioapi/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Diohilper.initdio();
  await CasHelper.inital();

  ///CasHelper.getsharedpref('isdark');
  //print('is dark : ${CasHelper.getsharedpref('isdark')}'); // ;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitNews()
        ..getbussinenews()
        ..getsciantesnews()
        ..getsportnews()
        ..changethemmode(fromshared: true),
      child: BlocConsumer<CubitNews, Newsstates>(
        listener: (context, state) {},
        builder: (context, state) {
          late bool? isdark = CasHelper.getsharedpref('isdark');
          if (isdark != null) {
            isdark = isdark;
          } else
            isdark = true;
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
                primarySwatch: Colors.orange,
                scaffoldBackgroundColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.amber),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.amber,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarBrightness: Brightness.light),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold))),
            themeMode: isdark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: Myhome(),
          );
        },
      ),
    );
  }
}
