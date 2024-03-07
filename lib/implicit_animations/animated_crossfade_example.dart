import 'package:flutter/material.dart';

class AnimatedCrossfadeExample extends StatefulWidget {
  const AnimatedCrossfadeExample({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossfadeExample> createState() => _AnimatedCrossfadeExampleState();
}

class _AnimatedCrossfadeExampleState extends State<AnimatedCrossfadeExample> {

  bool isFirst = true;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Animated Crossfade Example"), centerTitle: true,),
      body: Center(
        child: GestureDetector(
          onTap: (){
            setState(() {
              isFirst = !isFirst;
            });
          },
          child: AnimatedCrossFade(
            firstCurve: Curves.linear,
            secondCurve: Curves.linear,
            duration: const Duration(milliseconds: 500),
            firstChild: Container(
              width: 200,
              height: 200,
              color: Colors.blueGrey,
              child: Center(child: Image.asset("assets/images/dog.png"),),
            ),
            secondChild: Container(
              width: 200,
              height: 200,
              color: Colors.blueGrey,
              child: Center(child: Image.asset("assets/images/jerry.png"),),
            ),
            crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
      ),

    );
  }
}
