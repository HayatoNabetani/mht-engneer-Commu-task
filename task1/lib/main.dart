import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ログイン画面',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ログイン画面ページ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor("#5000B7"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 150, 40, 10),
        child: Column(
          children: <Widget>[
            Container(
              width: deviceWidth,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 80),
              child: Text(
                "your\nportfolio",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              )
            ),

            Container(
              margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                style:TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ),

            Container(
              margin:EdgeInsets.fromLTRB(0, 5, 0, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                style:TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ),

            Container(
              width: deviceWidth,
              child: Text(
                "Forget your password?",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ),

            Container(
              child: RaisedButton(
                child: Text('フォーカス'),
                onPressed: () {
                  // TODO: ここにフォーカスするためのコードを書く
                },
              )
            ),
            
          ]
        ),
      )
    );
  }
}
