import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {

  int _jerryAlign = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Animated Align Example"), centerTitle: true,),
      body: Stack(
        children:  [
           AnimatedAlign(
               alignment: getNextAlignment(_jerryAlign),
               duration: Duration(milliseconds: 300),
             child: Container(
               color: Colors.transparent,
               width: 100,
               height: 100,
               child: Image.asset("assets/images/jerry.png"),
             ),
           ),
          AnimatedAlign(
            alignment: getNextAlignment(_jerryAlign + 1),
            duration: Duration(seconds: 1),
            child: Container(
              color: Colors.transparent,
              width: 100,
              height: 100,
              child: Image.asset("assets/images/tom.png"),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.animation),
        onPressed: (){
          setState(() {
            _jerryAlign = _jerryAlign + 1;
          });
        },
      ),
    );
  }

  Alignment getNextAlignment(int jerryAlign){
    switch(jerryAlign){
      case 1:
        return Alignment.topCenter;
        break;
      case 2:
        return Alignment.topRight;
        break;
      case 3:
        return Alignment.centerLeft;
        break;
      case 4:
        return Alignment.center;
        break;
      case 5:
        return Alignment.centerRight;
        break;
      case 6:
        return Alignment.bottomLeft;
        break;
      case 7:
        return Alignment.bottomCenter;
        break;
      case 8:
        return Alignment.bottomRight;
        break;
      default:
        _jerryAlign = 0;
        return Alignment.topLeft;


    }
  }
}
