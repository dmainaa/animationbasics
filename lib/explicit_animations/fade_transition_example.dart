import 'package:flutter/material.dart';

class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({Key? key}) : super(key: key);

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4 ));
    _animation = Tween<double>(begin: 0, end: 7).animate(_controller);
  }

  _startAnimation(){
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Fade Transition"), centerTitle: true,),
      body: Center(
        child: FadeTransition(opacity: _animation,  child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(child:  Text("Fade me now!", style: TextStyle(color: Colors.white, fontSize: 25),),),
        ),),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        child: const Icon(Icons.play_arrow),
      ),

    );
  }


}
