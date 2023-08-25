import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text("BMI Calculator",
        style: TextStyle(
          color: Colors.amber
        ),),
        centerTitle: true,
        backgroundColor: Colors.black54,
        shadowColor: Colors.grey,
          elevation: 1,
      ),
      body:
        Column(
          children:  [
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: 150,
                    color: Colors.black54,
                    child:  TextField(
                      controller: _heightController,
                      style: const TextStyle(color: Colors.amber, fontSize: 35),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 40,
                          color: Colors.white60,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 150,
                    color: Colors.black54,
                      child:   TextField(
                        controller: _weightController,
                        style: const TextStyle(fontSize: 35, color: Colors.amber),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                  hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 40,
                          color: Colors.white60,
                          fontWeight: FontWeight.bold
                      )
                  ),
            ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                  backgroundColor: Colors.black12),
                onPressed: () {
                double height = double.parse(_heightController.text);
                double weight = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = weight / (height*height);
                  if(_bmiResult > 25 ){
                    _textResult = "Over Weight";
                  }else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = " Normal";
                  }else if(_bmiResult<18.5){
                    _textResult = "Under Weight";
                  }else{
                    _textResult = "Error";
                  }
                });

                },
                child: const Text("Calculate",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                ),
                )
            ),
            const SizedBox(height: 50,),
             Text(_bmiResult.toString(),
            style: const TextStyle(
                color: Colors.amber,
              fontSize: 30,
            ),
            ),
            // const Text("Created By Mersad",
            //   style: TextStyle(
            //     fontSize: 10,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white54,
            //   ),
            // ),
            const SizedBox(height: 50,),
             Visibility(
               visible: _textResult.isNotEmpty,
               child: Text(
                 _textResult,style:
                const TextStyle(
                  color: Colors.amber,
                  fontSize: 25,
                ),
            ),
             ),
            const SizedBox(height: 40 ),
            const RightBar(barWidth: 35),
            const RightBar(barWidth: 90),
            const RightBar(barWidth: 35),
            const SizedBox(height: 30),
               ElevatedButton(onPressed: () => exit(0),
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.black54
                  ),
                  child: const Text("Exit",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.amber
                    ),)
              ),
            const LeftBar(barWidth: 35),
            const LeftBar(barWidth: 90),
            const LeftBar(barWidth: 35),
            const SizedBox(height: 60),
          ],
        )
    );
  }
}

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 26,
              width: barWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Colors.amber,
              ),
          ),
        ],
      ),
    );
  }
}

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 26,
            width: barWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
