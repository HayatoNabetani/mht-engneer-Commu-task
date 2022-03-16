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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor("#5000B7"),
      body: Form(
        key:_formKey,
        child:Padding(
          padding: EdgeInsets.fromLTRB(40, 150, 40, 10),
          child: Column(
            children: <Widget>[
              Container(
                width: deviceWidth,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 80),
                child: const Text(
                  "your\nportfolio",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                )
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  obscureText:false,
                  autocorrect:true,
                  enableInteractiveSelection:true,
                  keyboardType:TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  obscureText:true,
                  autocorrect:false,
                  enableInteractiveSelection:false,
                  keyboardType:TextInputType.visiblePassword,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (value) {
                    // TODO: ここで取得したtextを使う
                    if (value == null || value.length < 5) {
                      return '５文字より少ないです';
                    }
                    return null;
                  },
                )
              ),

              Container(
                width: deviceWidth,
                child: const Text(
                  "Forget your password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ),

              Container(
                margin:const EdgeInsets.fromLTRB(0, 40, 0, 0),
                width: deviceWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("FF473A"), //ボタンの背景色
                    padding: const EdgeInsets.fromLTRB(10,20,10,20)
                  ),
                  child: const Text(
                    'ログイン',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                )
              ),
              
            ]
          ),
        )
      )
    );
  }
}
