import 'package:flutter/material.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({Key? key}) : super(key: key);

  @override
  State<AnimatedPhysicalModelExample> createState() => _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState extends State<AnimatedPhysicalModelExample> {
  bool _isPressed = false;
  _toggleElevation(){
    setState(() {
      _isPressed = !_isPressed;
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: const Text("Animated Physical Model Example"), centerTitle: true,),
      body: Center(
        child: GestureDetector(
          onTap: (){
            _toggleElevation();
          },
          child: AnimatedPhysicalModel(
            elevation: _isPressed ? 90 : 0,
            color: Colors.grey,
            shadowColor: Colors.blueGrey,
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 400),
            shape: BoxShape.rectangle ,
            child: Container(
            width: 100,
            height: 100,
              child: Image.asset("assets/images/jerry.png"),
            ),
          ),
        ),
      ),

    );
  }
}
