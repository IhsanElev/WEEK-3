import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:week3/constant/constant.dart';
import 'dart:convert';
import 'package:week3/constant/modelKamus.dart';

class kamus extends StatefulWidget {
  @override
  _kamusState createState() => _kamusState();
}

class _kamusState extends State<kamus> {
  var loading = false;
  final list = new List<KamusModel>();

  Future _lihatData() async {
    list.clear();
    setState(() {
      loading = true;
    });
    final response = await http.get(BaseUrl().kamus);

    if (response.contentLength == 2) {
    } else {
      final data = jsonDecode(response.body);
      data.forEach((api) {
        final ab = new KamusModel(
          api['id'],
          api['isi'],
          api['arti'],
        );
        list.add(ab);
      });
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lihatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () {
        _lihatData();
      },
      child: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                final x = list[i];
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  x.isi,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(x.arti),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.pink,
                        height: 1,
                        thickness: 2,
                      ),
                    ],
                  ),
                );
              }),
    ));
  }
}
