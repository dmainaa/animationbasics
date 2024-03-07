import 'package:flutter/material.dart';


class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({Key? key}) : super(key: key);

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {

  List<String> characters = ["tom", "jerry", "cheese", "dog"];

  double _paddingValue = 10;
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Animated Padding Example"), centerTitle: true,),
      body: Center(
        child: GridView.count(
            crossAxisCount: 2,
          children: List.generate(characters.length, (index){
            return AnimatedPadding(
              padding: EdgeInsets.all(_paddingValue),
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Image.asset("assets/images/${characters[index]}.png"),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isExpanded ? Icons.expand_less : Icons.expand),
        onPressed: (){
          setState(() {
           _isExpanded = !_isExpanded;
           _paddingValue = _isExpanded ? 30.0 : 10.0;
          });
        },
      ),
    );
  }
}
