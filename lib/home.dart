import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = '';
  double _x = -1, _y = -1;

  void updateText() {
    setState(() {
      if (_x == -1 || _y == -1) {
        _text = 'Please fill all fields';
      }
      else {
        _text = (_x + _y).toString();
      }
    });
  }

  void updateX(String x) {
    if (x.trim() == '') {
      _x = -1;
    }
    else {
      _x = double.parse(x);
    }
  }

  void updateY(String y) {
    if (y.trim() == '') {
      _y = -1;
    }
    else {
      _y = double.parse(y);
    }
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
              Text('Sum: $_text', style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 20.0),
              MyTextField(f: updateX, hint: 'Enter X'),
              const SizedBox(height: 20.0),
              MyTextField(f: updateY, hint: 'Enter Y'),
              const SizedBox(height: 20.0),
              ElevatedButton(onPressed: () {updateText();}, child: Text('SUM', style: TextStyle(fontSize: 24.0),))
            ],
          ),
        )
    );
  }
}

class MyTextField extends StatelessWidget {

  Function(String) f;
  String hint;

  MyTextField({required this.hint, required this.f, super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 300.0, height: 50.0,
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        style: const TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: hint
        ),
        onChanged: (text) { f(text);},
      ),
    );
  }
}
