import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applinews/blocmangment/screenbottom/dioapi/dio.dart';
import 'package:flutter_applinews/blocmangment/screenbottom/news.dart';
import 'package:flutter_applinews/blocmangment/screenbottom/sciance.dart';
import 'package:flutter_applinews/blocmangment/screenbottom/sport.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cashhelper.dart';
import 'newsstats.dart';

class CubitNews extends Cubit<Newsstates> {
  CubitNews() : super(Newsinitestat());

  static CubitNews get(context) => BlocProvider.of(context);
  int curenindex = 0;
  List<BottomNavigationBarItem> bottomiteams = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sport'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science')
  ];
  List<Widget> screen = [Sciance(), Sport(), Newsscience()];

  void changecurent(int value) {
    curenindex = value;
    emit(Newschangebottomitemstat());
  }

  List<dynamic> bussnice = [];

  List<dynamic> sport = [];

  List<dynamic> scintance = [];

  List<dynamic> search = [];

  //https://newsapi.org/

  //v2/top-headlines
  //?country=eg&apiKey=b739f2cf151342dfbaee6b6c9b010d8a

  void getbussinenews() {
    emit(Newsloadcondichnalstat());
    Diohilper.getfromapi(path: 'v2/top-headlines', qury: {
      'country': 'eg',
      'apiKey': 'b739f2cf151342dfbaee6b6c9b010d8a'
    }).then((value) {
      bussnice = value.data['articles'];
      emit(Newsgetfromapistat());
      print(bussnice.length.toString());
    }).catchError((onError) {
      print(onError.toString());
    });
  }

//https://newsapi.org/
//v2/top-headlines
//?country=eg&category=sports&apiKey=b739f2cf151342dfbaee6b6c9b010d8a
  void getsportnews() {
    emit(Newsloadcondichnalssportstat());
    Diohilper.getfromapi(path: 'v2/top-headlines', qury: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'b739f2cf151342dfbaee6b6c9b010d8a'
    }).then((value) {
      sport = value.data['articles'];
      emit(Newsgetnewssportstat());
      print(sport.length.toString());
    }).catchError((onError) {
      print(onError.toString());
    });
  }

// https://newsapi.org/
//v2/ top-headlines
// ?country=eg&category=science&apiKey=b739f2cf151342dfbaee6b6c9b010d8a
  void getsciantesnews() {
    emit(Newsloadcondichnalscianteststat());
    Diohilper.getfromapi(path: 'v2/top-headlines', qury: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'b739f2cf151342dfbaee6b6c9b010d8a'
    }).then((value) {
      scintance = value.data['articles'];
      emit(Newsgetnewsscianteststat());
      print(scintance.length.toString());
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  //https://newsapi.org/v2/everything?
  //q=tesla&apiKey=b739f2cf151342dfbaee6b6c9b010d8a
  void searchnews(String searchkey) {
    emit(Newsloadcondesinalsearch());
    Diohilper.getfromapi(path: 'v2/everything', qury: {
      'q': searchkey,
      'apiKey': 'b739f2cf151342dfbaee6b6c9b010d8a'
    }).then((value) {
      search = value.data['articles'];
      emit(Newsgetsearch());
      print(search.length.toString());
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  bool isdarck = true;
  ThemeMode themeMode = ThemeMode.light;
  void changethemmode({required bool fromshared}) {
    if (fromshared) {
      isdarck = !fromshared;
      CasHelper.putSharedpreferance(key: 'isdark', value: isdarck)
          .then((value) {
        emit(Newsconvertdarktolight());
      });
    } else {
      isdarck = !isdarck;
      CasHelper.putSharedpreferance(key: 'isdark', value: isdarck)
          .then((value) {
        emit(Newsconvertdarktolight());
      });
    }
  }
}
