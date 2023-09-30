import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applinews/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../newscubit.dart';
import '../newsstats.dart';

class Sciance extends StatelessWidget {
  const Sciance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews, Newsstates>(
      listener: (context, stat) {},
      builder: (context, stat) {
        var newsubit = CubitNews.get(context);
        return ConditionalBuilder(
          condition: newsubit.bussnice.length > 0,
          builder: (context) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    iteamlist(newsubit.bussnice[index], context),
                separatorBuilder: (context, index) => Container(
                      height: 1.0,
                      color: Colors.blue,
                    ),
                itemCount: newsubit.bussnice.length);
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
