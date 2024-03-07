import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> with SingleTickerProviderStateMixin {

  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    // _controller.repeat(reverse: true);
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

  }


  _startAnimation(){
    _controller.reset();
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rotation Transition"), centerTitle: true,),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller ,
          builder: (BuildContext context, Widget? child){
            return Transform.rotate(angle: _controller.value * (2* pi), child: Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: Image.asset("assets/images/dog.png"),

            ),);
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
