import 'package:animationbasics/explicit_animations/default_textstyle_transition_example.dart';
import 'package:animationbasics/explicit_animations/fade_transition_example.dart';
import 'package:animationbasics/explicit_animations/indexed_stack_transition_example.dart';
import 'package:animationbasics/explicit_animations/positioned_animation_example.dart';
import 'package:animationbasics/explicit_animations/positioned_directional_transition_example.dart';
import 'package:animationbasics/explicit_animations/rotation_transition_example.dart';
import 'package:animationbasics/explicit_animations/size_transition_example.dart';
import 'package:animationbasics/explicit_animations/tween_animation_builder.dart';
import 'package:flutter/material.dart';

import 'animated_builder_example.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationsScreen> createState() => _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Explicit Animations"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const SizedBox(height: 10,),
              getColumnRow(const PositionedAnimationExample(), "Positioned Animation Example"),
              const SizedBox(height: 10,),
              getColumnRow(const SizeTransitionExample(), "Size Transition Example"),
              const SizedBox(height: 10,),
              getColumnRow(const RotationTransitionExample(), "Rotation Transition Example "),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedBuilderExample(), "Animated Builder Example"),
              const SizedBox(height: 10,),
              getColumnRow(const FadeTransitionExample(), "Fade Transition Example"),
              const SizedBox(height: 10,),
              getColumnRow(const PositionedDirectionalTransitionExample(), "Positioned Directional Transition Example"),
              const SizedBox(height: 10,),
              const SizedBox(height: 10,),
              getColumnRow(const TweenAnimationBuilderExample(), "Tween Animated Builder"),
              const SizedBox(height: 10,),
              getColumnRow(const DefaultTextStyleTransitionExample(), "Default Text Style Transition"),
              const SizedBox(height: 10,),
              getColumnRow(const IndexedStackTransitionExample(), "Indexed Stack Transition"),
              // const SizedBox(height: 10,),
              // getColumnRow(const AnimatedPhysicalModelExample(), "Animated Physical Model"),
              // const SizedBox(height: 10,),
              // getColumnRow(const AnimatedPositionExample(), "Animated Position"),
              // const SizedBox(height: 10,),
              // getColumnRow(const AnimatedPositionDirectionalExample(), "Animated Position Directional"),
              // const SizedBox(height: 10,),
              // getColumnRow(const AnimatedCrossfadeExample(), "Animated Crossfade Example"),
              // const SizedBox(height: 10,),
              // getColumnRow(const AnimatedSwitcherExample(), "Animated Switcher Example"),
              // const SizedBox(height: 10,),
              // getColumnRow(const AnimatedListExample(), "Animated List Example"),
              // const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getColumnRow(Widget toPage, String text){
    return ElevatedButton(style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red
    ), onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return toPage;
      }));
    }, child: Padding(
      padding: const  EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 50,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Center(
          child: Text(text, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white, fontSize: 12.0),),
        ),
      ),
    ));
  }
}
