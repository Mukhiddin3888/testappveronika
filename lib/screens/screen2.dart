import 'package:flutter/material.dart';


class Screen2 extends StatelessWidget {


  final String title;
  final bool isLightMode;

  const Screen2({Key? key, required this.title, required this.isLightMode}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isLightMode ? ThemeData.light() : ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Screen 2"),),
        body: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
