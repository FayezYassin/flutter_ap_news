import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applinews/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../newscubit.dart';
import '../newsstats.dart';

class Newsscience extends StatelessWidget {
  const Newsscience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews, Newsstates>(
      listener: (context, stat) {},
      builder: (context, stat) {
        var scintens = CubitNews.get(context);
        return ConditionalBuilder(
          condition: scintens.scintance.length > 0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  iteamlist(scintens.scintance[index], context),
              separatorBuilder: (context, index) => Container(
                    width: 1.0,
                    color: Colors.blue,
                  ),
              itemCount: scintens.scintance.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
