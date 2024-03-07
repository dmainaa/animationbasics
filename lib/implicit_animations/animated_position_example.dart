import 'package:flutter/material.dart';


class AnimatedPositionExample extends StatefulWidget {
  const AnimatedPositionExample({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionExample> createState() => _AnimatedPositionExampleState();
}

class _AnimatedPositionExampleState extends State<AnimatedPositionExample> {

  bool _startEating = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Position Example"), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            AnimatedPositioned(
                top: 0,
                left: 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/images/cheese.png"),
                )),
            AnimatedPositioned(
                top: 0,
                left: _startEating ? MediaQuery.of(context).size.width - 150 : 0  ,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/images/jerry.png"),
                )),
            AnimatedPositioned(
                top: _startEating ? MediaQuery.of(context).size.width / 2 : 0,
                left: _startEating ?  MediaQuery.of(context).size.width - 150: 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/images/dog.png"),
                )),
            AnimatedPositioned(
                top: _startEating ?  MediaQuery.of(context).size.height  - 300 : 0,
                left: 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/images/tom.png"),
                )),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        setState(() {
        _startEating = !_startEating;
        });
      }, child: _startEating ?  const Icon(Icons.place) : const Icon(Icons.back_hand)),
    );
  }
}
