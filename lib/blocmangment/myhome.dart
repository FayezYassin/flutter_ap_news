import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applinews/blocmangment/screenbottom/dioapi/dio.dart';
import 'package:flutter_applinews/blocmangment/screenbottom/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cashhelper.dart';
import '../searchscreen.dart';
import 'newscubit.dart';
import 'newsstats.dart';

class Myhome extends StatelessWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews, Newsstates>(
        listener: (context, stat) {},
        builder: (context, stat) {
          var cubitnews = CubitNews.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('NewsApp'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Searchscereen()));
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      bool? dark = CasHelper.getsharedpref('isdark');
                      print('fayez yassin : $dark');
                      cubitnews.changethemmode(fromshared: dark!);
                      print('fayez yassin : $dark');
                    },
                    icon: Icon(Icons.dark_mode_outlined)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubitnews.bottomiteams,
              currentIndex: cubitnews.curenindex,
              onTap: (value) {
                cubitnews.changecurent(value);
              },
            ),
            body: cubitnews.screen[cubitnews.curenindex],
          );
        });
  }
}
