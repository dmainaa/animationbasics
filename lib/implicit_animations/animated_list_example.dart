import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({Key? key}) : super(key: key);

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List<String> _list = [];

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      addItem();
    });


    super.initState();
  }


  void addItem(){
    setState(() {

      if(_list.length != 10){
        _list.insert(0, "New Item ${_list.length}");
        _listKey.currentState?.insertItem(0);
      }else{
        timer.cancel();
      }

    });
  }

  void removeItem(int index){
    setState(() {
      String removedItem = _list[index];
      _list.removeAt(index);
      _listKey.currentState?.removeItem(index, (context, animation){
        return ListTile(title: Text(removedItem), textColor: Colors.red,);
      }, duration: const Duration(milliseconds: 500));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Animated List Example"), centerTitle: true,),
      body: AnimatedList(
        key: _listKey,
        itemBuilder: (BuildContext context, int index, Animation<double> animation){
          return SizeTransition(
              sizeFactor: animation,
              child: Container(
                color: Colors.amber,
                child: ListTile(
                  title: Text(_list[index]),
                  trailing: IconButton(onPressed: (){
                      removeItem(index);
                  }, icon: const Icon(Icons.delete),),
                ),
              ),
          );
        } ,

      ),
      floatingActionButton: FloatingActionButton(onPressed: addItem, child: const Icon(
        Icons.add
      ),),
    );
  }
}
