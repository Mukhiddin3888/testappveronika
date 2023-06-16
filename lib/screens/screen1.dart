import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veronika_test_switch/screens/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool isLightMode = true;
  String title = "Hello World";
  List<SwitchLogsModel> logsOfSwitch = [];

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text(title),
            trailing: CupertinoSwitch(
              value: isLightMode,
              onChanged: (v) {

                setState(() {
                  isLightMode = v;
                  title = isLightMode ?  "Hello World" : "Bye World" ;


                });


              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: logsOfSwitch.length,
              itemBuilder: (context, index) {
              return ListTile(
                title: Text(logsOfSwitch[index].title),
                subtitle: Text(logsOfSwitch[index].dateTime.toString()),
                trailing: Text('${logsOfSwitch[index].mode}'),
              );
            },),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          SwitchLogsModel logs = SwitchLogsModel(
            title: title,
            dateTime: DateTime.now(),
            mode: isLightMode,
          );
          setState(() {
            logsOfSwitch.add(logs);
          });


          Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(title: isLightMode ? "привет мир" : "пока мир", isLightMode: isLightMode),));
        },
        child: const Icon(Icons.arrow_forward_ios),

      ),
    );
  }
}


class SwitchLogsModel{

  final DateTime dateTime;
  final bool mode;
  final String title;

  SwitchLogsModel({ required this.dateTime, required this.mode, required this.title});

}