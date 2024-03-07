import 'package:flutter/material.dart';


class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Page Two', style: TextStyle(color:  Colors.white),),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);

        }, child:  const Text("Go Back"),)
        ,
      ),
    );
  }
}
