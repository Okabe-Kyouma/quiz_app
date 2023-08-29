import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
         child: Container(
        decoration:const BoxDecoration( gradient: LinearGradient(
                colors: [ Color.fromARGB(255, 78, 13, 151),
         Color.fromARGB(255, 107, 15, 168)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             const Text('The Question...',style: TextStyle(fontSize: 24,color: Colors.white),),
             const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {},
               child: const Text("Answer 1")),
                ElevatedButton(
                onPressed: () {},
               child: const Text("Answer 2")),
                ElevatedButton(
                onPressed: () {},
               child: const Text("Answer 3")),
                ElevatedButton(
                onPressed: () {},
               child: const Text("Answer 4")),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
