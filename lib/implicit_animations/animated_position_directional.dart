import 'package:flutter/material.dart';

class AnimatedPositionDirectionalExample extends StatefulWidget {
  const AnimatedPositionDirectionalExample({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionDirectionalExample> createState() => _AnimatedPositionDirectionalExampleState();
}

class _AnimatedPositionDirectionalExampleState extends State<AnimatedPositionDirectionalExample> {

  double start = 0;
  double top = 0;


  void moveLeft(){
    setState(() {
      start -= 50;
      if(start < 0){
        start = 0;
      }

    });
  }

    void moveRight(){
      setState(() {
        start += 50;
        if(start >= MediaQuery.of(context).size.width - 120){
          start = MediaQuery.of(context).size.width - 120;
        }
      });
    }
    void moveUp(){
      setState(() {
        top -= 50;
        if(top < 0){
          top = 0;
        }

      });
    }
    void moveDown(){
      setState(() {
        top += 50;
        if(top >= MediaQuery.of(context).size.height - 320){
          top = MediaQuery.of(context).size.height - 320;
        }
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Position Directional Example"), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
                top: top,
                start: start,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.transparent,
                  child: Image.asset("assets/images/jerry.png"),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                      moveLeft();
                  }, child: const Icon(
                    Icons.arrow_circle_left_outlined
                  )),
                  ElevatedButton(onPressed: (){
                    moveRight();
                  }, child: const Icon(
                      Icons.arrow_circle_right_outlined
                  )),
                  ElevatedButton(onPressed: (){
                    moveUp();
                  }, child: const Icon(
                      Icons.arrow_circle_up
                  )),
                  ElevatedButton(onPressed: (){
                    moveDown();
                  }, child: const Icon(
                      Icons.arrow_circle_down
                  ))
                ],
              ),
            )


          ],

        ),
      ),

    );
  }
}
