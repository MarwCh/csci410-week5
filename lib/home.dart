import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _text = '';

  void updateText(String text) {
    setState(() {
      _text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Text('You typed: $_text', style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 20.0,),
              SizedBox(width: 300.0, height: 50.0,
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter some text'
                  ),
                  onChanged: (text) { updateText(text);},
                ),
              ),
            ],
          ),
        )
    );
  }
}
