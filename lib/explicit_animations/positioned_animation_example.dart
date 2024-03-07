import 'package:flutter/material.dart';


class PositionedAnimationExample extends StatefulWidget {
  const PositionedAnimationExample({Key? key}) : super(key: key);

  @override
  State<PositionedAnimationExample> createState() => _PositionedAnimationExampleState();
}

class _PositionedAnimationExampleState extends State<PositionedAnimationExample> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<RelativeRect> _jerryanimation;
  late Animation<RelativeRect> _tomanimation;
  late Animation<RelativeRect> _spikeanimation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _jerryanimation = RelativeRectTween(begin: const RelativeRect.fromLTRB(0, 0, 0, 0), end: const RelativeRect.fromLTRB(250, 250, 0, 0),).animate(_controller);
    _tomanimation = RelativeRectTween(begin: const RelativeRect.fromLTRB(0, 0, 0, 0), end: const RelativeRect.fromLTRB(150, 150, 0, 0),).animate(_controller);
    _spikeanimation = RelativeRectTween(begin: const RelativeRect.fromLTRB(0, 0, 0, 0), end: const RelativeRect.fromLTRB(50, 50, 0, 0),).animate(_controller);
  }

  void startAnimation(){
    _controller.reset();
    _controller.forward();
  }

  void resetAnimation(){
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Positioned Animation Example"), centerTitle: true,),
      body: Stack(
        children: [
          PositionedTransition(rect: _spikeanimation, child: Container(
            width: 100,
            height: 100,
            color: Colors.blueGrey,
            child: Image.asset("assets/images/dog.png"),
          )),
          PositionedTransition(rect: _tomanimation, child: Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            child: Image.asset("assets/images/tom.png"),
          )),
          PositionedTransition(rect: _jerryanimation, child: Container(
            width: 100,
            height: 100,
            color: Colors.orange,
            child: Image.asset("assets/images/jerry.png"),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  startAnimation();
                }, child: const Icon(Icons.start)),
                ElevatedButton(onPressed: resetAnimation, child: const Icon(Icons.close)),

              ],
            ),
          )
        ],
      ),

    );


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
}
