import 'package:flutter/material.dart';

class AnimationControllerStatus extends StatefulWidget {
  const AnimationControllerStatus({Key? key}) : super(key: key);

  @override
  State<AnimationControllerStatus> createState() => _AnimationControllerStatusState();
}

class _AnimationControllerStatusState extends State<AnimationControllerStatus> with SingleTickerProviderStateMixin{


  late AnimationController _animationController;
  late Animation animation;


  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
        vsync: this
    );

    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))..addListener(() {
      setState(() {

      });
    })..addStatusListener((status) {

    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Animated Container Background"), automaticallyImplyLeading: true, centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Animation Controller Value: ${_animationController.value.toString()}", ),
            SizedBox(height: 20,),
            Text("Animation  Value: ${animation.value.toString()}", ),
            SizedBox(height: 20,),
            Container(padding: EdgeInsets.all(8.0), child: Container(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: animation.value
                ),
              ),
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(iconSize: 30, onPressed: (){
                  _animationController.forward();
                }, icon: Icon(Icons.start), color: Colors.blue,),
                IconButton(iconSize: 30, onPressed: (){
                  _animationController.reverse();
                }, icon: Icon(Icons.arrow_back_outlined), color: Colors.blue,),

              ],
            )

          ],
        ),
      ),
    );
  }
}
