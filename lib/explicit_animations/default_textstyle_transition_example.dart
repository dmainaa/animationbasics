import 'package:flutter/material.dart';


class DefaultTextStyleTransitionExample extends StatefulWidget {
  const DefaultTextStyleTransitionExample({Key? key}) : super(key: key);

  @override
  State<DefaultTextStyleTransitionExample> createState() => _DefaultTextStyleTransitionExampleState();
}

class _DefaultTextStyleTransitionExampleState extends State<DefaultTextStyleTransitionExample> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  TextStyle _style1 = TextStyle(
    fontSize: 26,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );
  TextStyle _style2 = TextStyle(
      fontSize: 30,
      color: Colors.red,
      fontWeight: FontWeight.normal
  );


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: DefaultTextStyleTransition(

          style: _animation.drive(TextStyleTween(begin: _style1, end: _style2)),
          child: const Text("Hello there"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_controller.status == AnimationStatus.completed){
            _controller.reverse();
          }else{
            _controller.forward();
          }
        },
        child: const Icon(Icons.play_arrow, color: Colors.white,),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
