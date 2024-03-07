import 'package:flutter/material.dart';


class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherExample> createState() => _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {

  bool _isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Switcher Example"), centerTitle: true,),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: _isFirst ?
          ElevatedButton(onPressed: (){
            setState(() {
              _isFirst = !_isFirst;
            });

          }, child: const Text("Login now")) : const CircularProgressIndicator()
          ,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _isFirst = !_isFirst;
          });
        },
        child: const Icon(Icons.switch_account),
       ),

    );
  }
}
