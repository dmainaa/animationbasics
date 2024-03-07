import 'package:animationbasics/explicit_animations/explicit_animations_screen.dart';
import 'package:animationbasics/main.dart';
import 'package:animationbasics/page_transitions/page_animations.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animations"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                      ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue
                  ), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: "title")));
              }, child: const Text("Implicit Animations", style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),)),
              const SizedBox(height: 15.0,),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent
              ), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExplicitAnimationsScreen()));
              }, child: const Text("Explicit Animations", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),)),
              const SizedBox(height: 15.0,),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber
              ), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MPageAnimations()));
              }, child: const Text("Page Animations", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),)),

            ],
          ),
        ),
      ),
    );
  }
}
