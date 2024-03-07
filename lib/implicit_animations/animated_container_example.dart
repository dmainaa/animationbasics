import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {

  Color _color = Colors.grey;

  double _radius = 20;

  double _width = 100;
  double _height = 100;

  setAnimationValues(){
    setState(() {
      _color = Colors.orange;
      _radius = 40;
      _width = _width + 10;
      _height = _height + 10;

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Animated Container Example"), centerTitle: true,),
      body: Center(
        child: GestureDetector(
          onTap: (){
            setAnimationValues();
          },
          child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(_radius)
            ),
            child: Image.asset("assets/images/jerry.png"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.animation),
        onPressed: (){
          setState(() {
             _color = Colors.grey;
             _radius = 20;
             _width = 100;
             _height = 100;
          });
        },
      ),
    );
  }
}
