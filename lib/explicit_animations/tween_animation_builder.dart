import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({Key? key}) : super(key: key);

  @override
  State<TweenAnimationBuilderExample> createState() => _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState extends State<TweenAnimationBuilderExample> {

  double opacityLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Tween Animation Builder"), centerTitle: true,),
      body:  Container(
          color: Colors.black12,
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: opacityLevel),
                    duration: const Duration(seconds: 2),
                    builder: (BuildContext context, double value, Widget? child){
                      return Opacity(opacity: value, child: child,);
                    },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16)

                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    opacityLevel = opacityLevel == 0.0 ?  1.0 : 0.0;

                  });
                }, child: Text("Animate"))
              ],
            ),
          ),

        ),

    );
  }
}
