import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(title: 'TIP CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String Bill = "";
  double tip =0;
  double ans=0;
  void bill_tip() {
    setState(() {
      var am = int.parse(Bill);
      ans = ((am*tip)/100) ;

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  onChanged: (text) {
                    Bill = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bill',
                    hintText: 'Enter bill Amount',
                  ),

                ),
              ),
              Slider(
                value: tip,
                max: 50,
                divisions: 5,
                label: tip.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    tip = value;
                  });
                },
              ),
              Text(
                '$ans',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),

            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: ElevatedButton(
            child: Text("Calculate", style: TextStyle(fontSize: 20),),
            onPressed: bill_tip,
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal),
              padding: EdgeInsets.all(8.0),
            ),
          ),
        )
    );
  }    // This trailing comma makes auto-formatting nicer for build methods.
}