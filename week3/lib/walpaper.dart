import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class walpaper extends StatefulWidget {
  @override
  _walpaperState createState() => _walpaperState();
}

class _walpaperState extends State<walpaper> {
  List<Container> walpaper = new List();
  var gambar = [
    {
      "nama": "fanny",
      "gambar":
          "https://gamebrott.com/wp-content/uploads/2019/01/11-1-768x432.png"
    },
    {
      "nama": "aldous",
      "gambar": "https://gamebrott.com/wp-content/uploads/2019/01/1-1.png"
    },
    {
      "nama": "valir",
      "gambar": "https://gamebrott.com/wp-content/uploads/2019/01/2.png"
    },
    {
      "nama": "yu zhong",
      "gambar": "https://gamebrott.com/wp-content/uploads/2019/01/3.png"
    },
    {
      "nama": "yi sun sin",
      "gambar": "https://gamebrott.com/wp-content/uploads/2019/01/5.png"
    },
    {
      "nama": "ruby",
      "gambar": "https://gamebrott.com/wp-content/uploads/2019/01/6.png"
    },
    {
      "nama": "roger",
      "gambar":
          "https://gamebrott.com/wp-content/uploads/2019/01/11-1-768x432.png"
    }
  ];
  _buatDataList() async {
    for (var i = 0; i < gambar.length; i++) {
      final Walpaper = gambar[i];
      final String WalpaperMobileLegend = Walpaper["gambar"];
      walpaper.add(new Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
            child: Hero(
                tag: Walpaper["nama"],
                child: Image.network(
                  WalpaperMobileLegend,
                  height: 180.0,
                  width: 125.0,
                  fit: BoxFit.contain,
                ))),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _buatDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Walpaper'),
      ),
      body: GridView.count(crossAxisCount: 2, children: walpaper),
    );
  }
}
