import 'package:flutter/material.dart';

class IndexedStackTransitionExample extends StatefulWidget {
  const IndexedStackTransitionExample({Key? key}) : super(key: key);

  @override
  State<IndexedStackTransitionExample> createState() => _IndexedStackTransitionExampleState();
}

class _IndexedStackTransitionExampleState extends State<IndexedStackTransitionExample> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  late Animation<double> _opacityAnimation;

  late Animation<double> _scaleAnimation;

  int _currentIndex = 0;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indexed Stack Transition Example"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ScaleTransition(scale: _scaleAnimation, child: FadeTransition(
            opacity: _opacityAnimation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.red,
              child: Image.asset("assets/images/jerry.png"),
            ),
          ),),
          ScaleTransition(scale: _scaleAnimation, child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
            child: Image.asset("assets/images/dog.png"),
          ),

          ),
          ScaleTransition(scale: _scaleAnimation, child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.green,
            child: Image.asset("assets/images/tom.png"),
          ),),

        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          goToNextScreen();
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white,),
      ),
    );
  }

  void goToNextScreen(){
    _currentIndex = _currentIndex + 1;
    if(_currentIndex == 3){
      _currentIndex = 0;
    }
    setState(() {
      _controller.reset();
      _controller.forward();
    });
  }
}
