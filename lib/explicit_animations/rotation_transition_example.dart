import 'package:flutter/material.dart';

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({Key? key}) : super(key: key);

  @override
  State<RotationTransitionExample> createState() => _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 7));
    _animation = Tween<double>(begin: 0, end: 7).animate(_controller);

  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }


  _startAnimation(){
    _controller.reset();
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Rotation Transition"), centerTitle: true,),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: Image.asset("assets/images/dog.png"),

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
