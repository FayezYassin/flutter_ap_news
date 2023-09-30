import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocmangment/screenbottom/webview.dart';

Padding iteamlist(model, context, {isssearch = false}) {
  String url = model['urlToImage'].toString();

  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            child: url.isEmpty ? Text('loading') : getchiledimage(url),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      ' ${model['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                    ),
                  ),
                  Text('${model['publishedAt']}')
                ],
              ),
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebViewscer(model['url'])));
      },
    ),
  );
}

Widget getchiledimage(url) {
  return Container(
    height: 120,
    width: 120,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
        image: DecorationImage(image: NetworkImage('$url'), fit: BoxFit.cover)),
  );
}

//SharedPreferences sharedPreferences = SharedPreferences.getInstance() as SharedPreferences;

