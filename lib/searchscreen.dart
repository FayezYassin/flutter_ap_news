import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applinews/blocmangment/newscubit.dart';
import 'package:flutter_applinews/blocmangment/newsstats.dart';
import 'package:flutter_applinews/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchscereen extends StatelessWidget {
  const Searchscereen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews, Newsstates>(
      listener: (context, stat) {},
      builder: (context, stat) {
        var searchcubit = CubitNews.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      label: Text('Search'),
                      prefixIcon: Icon(Icons.search)),
                  validator: (valu) {
                    if (valu!.isEmpty) {
                      return 'cant search of null';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    searchcubit.searchnews(value);
                  },
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: searchcubit.search.length > 0,
                  builder: (context) => ListView.separated(
                      itemBuilder: (context, index) => iteamlist(
                          searchcubit.search[index], context,
                          isssearch: true),
                      separatorBuilder: (context, index) => Container(
                            height: 1.0,
                          ),
                      itemCount: searchcubit.search.length),
                  fallback: (context) => Center(child: Text('')),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
