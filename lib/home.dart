import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // the first image to be displayed when we run the application
  String image = 'assets/image1.jpg';
  // add a list of image assets
  List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.png'
  ];
  // a static counter to keep track of which image will be displays when we press the button
  static int count = 0;

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
      // set new image from the images list using counter as index
      image = images[count];
      // update counter so that it doesn't exceed list length - 1
      count = (count + 1) % images.length;
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
              ElevatedButton(onPressed: () {updateText();}, child: const Text('SUM', style: TextStyle(fontSize: 24.0),)),
              Image.asset(image, width: 250.0, height: 250.0)
            ],
          ),
        )
    );
  }
}

class MyTextField extends StatelessWidget {

  final Function(String) f;
  final String hint;

  const MyTextField({required this.hint, required this.f, super.key,});

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
