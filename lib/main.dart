import 'package:animationbasics/explicit_animations/animated_builder_example.dart';
import 'package:animationbasics/implicit_animations/animated_align.dart';
import 'package:animationbasics/implicit_animations/animated_container_example.dart';
import 'package:animationbasics/implicit_animations/animated_crossfade_example.dart';
import 'package:animationbasics/implicit_animations/animated_list_example.dart';
import 'package:animationbasics/implicit_animations/animated_padding_example.dart';
import 'package:animationbasics/implicit_animations/animated_physical_model_example.dart';
import 'package:animationbasics/implicit_animations/animated_position_directional.dart';
import 'package:animationbasics/implicit_animations/animated_position_example.dart';
import 'package:animationbasics/implicit_animations/animated_textstyle_example.dart';
import 'package:animationbasics/implicit_animations/animation_controller_status.dart';
import 'package:flutter/material.dart';

import 'implicit_animations/animated_opacity_example.dart';
import 'implicit_animations/animated_switcher_example.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.blue,

      ),
      home: const MenuScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
        title: const Text("Animation Basics"),
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
              getColumnRow(const AnimationControllerStatus(), "Animated Container Background"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedAlignExample(), "Animated Stack Align"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedContainerExample(), "Animated Container "),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedTextStyleExample(), "Animated TextStyle"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedOpacityExample(), "Animated Opacity"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedPaddingExample(), "Animated Padding"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedPhysicalModelExample(), "Animated Physical Model"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedPositionExample(), "Animated Position"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedPositionDirectionalExample(), "Animated Position Directional"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedCrossfadeExample(), "Animated Crossfade Example"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedSwitcherExample(), "Animated Switcher Example"),
              const SizedBox(height: 10,),
              getColumnRow(const AnimatedListExample(), "Animated List Example"),
              const SizedBox(height: 10,),
              // getColumnRow(const AnimatedBuilderExample(), "Animated Builder Example"),
              // const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  Widget getColumnRow(Widget toPage, String text){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue
        ),
        onPressed: (){
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
