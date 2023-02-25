import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownvalue = 'cr7';
  String dropdownvalue2 = 'kaka';
  TextEditingController inpuText = TextEditingController();

  var items = ['cr7', 'Messi', 'neymar'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: const Text("Assignment 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondRoute(value: dropdownvalue ?? " ")),
                  );
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [

                  SizedBox(

                  
                    width: 300,
                    child: TextField(
                       onChanged: (text) {
    dropdownvalue2 = text;
  },
                      controller: inpuText,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter what u like',
                      ),
                    ),
                  ),
                  GestureDetector(onTap: () {
                   setState(() {
                      dropdownvalue2= inpuText.value.toString();
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                     SecondRoute(value: dropdownvalue2 ?? "sss")),
                  );
                   });
                  },
                  child: Text("send"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  SecondRoute({Key? key, required this.value}) : super(key: key);
  String value;

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Text("${widget.value}"),
      ),
    );
  }
}
