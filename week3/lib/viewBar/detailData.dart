import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:week3/constant/constant.dart';
import 'package:week3/constant/modelBerita.dart';

class NewsDetail extends StatefulWidget {
  NewsModel newsModel;
  NewsDetail(this.newsModel);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10,top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,


                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                  Image.network(
                    BaseUrl().insertNews + widget.newsModel.image,
                    width: 150.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                widget.newsModel.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text(widget.newsModel.date_news),
              SizedBox(height: 5,),
              Text(widget.newsModel.description),
            ],
          )

      ),
    );
  }
}
