import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {


  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Animated Opacity Example"), centerTitle: true,),
      body: Center(       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                  opacity: _isVisible ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  child: const Text(
                      "Tom and Jerry",
                    style: TextStyle(fontSize: 44.0),
                  ),

              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isVisible ? 1 : 0,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.decelerate,
                child:  Container(
                    width: 100,
                    height: 100,
                    color: Colors.transparent,
                    child: Image.asset("assets/images/tom.png")),

              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isVisible ? 1 : 0,
                duration: const Duration(milliseconds: 2500),
                curve: Curves.easeInCirc,
                child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.transparent,
                    child: Image.asset("assets/images/jerry.png")),

              ),
            ),
            const SizedBox(height: 10,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: (){
          setState(() {
            _isVisible = !_isVisible;
          });
        },
      ),
    );
  }
}
