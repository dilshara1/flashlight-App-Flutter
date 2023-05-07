import 'package:flutter/material.dart';
import 'package:torch/torch.dart'; // add this package to your pubspec.yaml file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashlight App',
      home: FlashlightPage(),
    );
  }
}

class FlashlightPage extends StatefulWidget {
  @override
  _FlashlightPageState createState() => _FlashlightPageState();
}

class _FlashlightPageState extends State<FlashlightPage> {
  bool _isOn = false;

  @override
  void dispose() {
    Torch.turnOff();
    super.dispose();
  }

  void _toggleFlashlight() {
    setState(() {
      _isOn = !_isOn;
    });
    if (_isOn) {
      Torch.turnOn();
    } else {
      Torch.turnOff();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashlight App'),
        backgroundColor: Color(0xFF7857D1),
      ),
      body: Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [
              Color(0xFF7857D1),
              Color(0xFF401F9A),
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _toggleFlashlight();
                          },
                          child: Icon(
                            Icons.flashlight_on_rounded,
                            color: _isOn ? Colors.yellow : Colors.grey,
                            size: 100,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Developed by CodeVidz',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
