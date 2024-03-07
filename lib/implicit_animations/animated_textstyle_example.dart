import 'package:flutter/material.dart';

class AnimatedTextStyleExample extends StatefulWidget {
  const AnimatedTextStyleExample({Key? key}) : super(key: key);

  @override
  State<AnimatedTextStyleExample> createState() => _AnimatedTextStyleExampleState();
}

class _AnimatedTextStyleExampleState extends State<AnimatedTextStyleExample> {

  double _fontSize = 30;
  Color _color = Colors.grey;

  doAnimation(){
    setState(() {
       _fontSize = 50;
       _color = Colors.orange;
    });
  }

  resetAnimation(){
    setState(() {
       _fontSize = 30;
       _color = Colors.grey;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Animated TextStyle Example"), centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: _fontSize,
                color: _color,

              ),
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceInOut,
              child: const Text("Hello Everyone")),
          const SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){
                    doAnimation();
                  },
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: (){
                    resetAnimation();
                  },
                  icon: const Icon(Icons.remove))
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.animation),
        onPressed: (){
          setState(() {

          });
        },
      ),
    );
  }
}
