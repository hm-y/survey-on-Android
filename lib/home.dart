import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  bool _active = false;
  String _question = "Please wait for the first question.";
  String _optionA = "Option A comes here";
  String _optionB = "Option B comes here";
  int _numberOfVotes = 0;
  int _qId = 1;

  void fetchNewQuestion(){
    fetchQuestion(_qId).then((data){
      setState(() {
        _question = data['body'];
        _optionA = data['name'];
        _optionB = data['name'].split('').reversed.join();
        _numberOfVotes = data['id'];
        _active = true;
      });
    });
  }

  void receiveAnswer(int choice){
    setState(() { 
      _active = false; 
      _qId++;
    });
    fetchNewQuestion();
  }

  Widget _textScroll(textContent){
    return SingleChildScrollView(
        child: Text(
          textContent,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold),
        )
    );
  }

  List<Widget> _survey(){
    Color btnActiveBackground = Colors.blue; 
    Color btnDisabledBackground = Colors.blue[300];
    Color btnTextColor = Colors.white;

    return <Widget>[
      // Question Text Box
      SizedBox(
        height: 200,
        width: double.maxFinite,
        child: Center(child: _textScroll(_question))
      ),
      SizedBox(height: 10),
      
      // Option Buttons
      SizedBox(
        height: 100,
        width: double.maxFinite,
        child: FlatButton(
          color: _active ? btnActiveBackground : btnDisabledBackground,
          textColor: btnTextColor,
          padding: EdgeInsets.all(3),
          onPressed: _active ? () => receiveAnswer(0) : null,
          child: _textScroll(_optionA)
        )
      ),
      SizedBox(height: 10),
      SizedBox(
        height: 100,
        width: double.maxFinite,
        child: FlatButton(
          color: _active ? btnActiveBackground : btnDisabledBackground,
          textColor: btnTextColor,
          padding: EdgeInsets.all(3),
          onPressed: _active ? () => receiveAnswer(1) : null,
          child: _textScroll(_optionB)
        )
      ),
      OutlineButton(
        color: Colors.grey,
        padding: EdgeInsets.all(10),
        onPressed: () => receiveAnswer(2),
        child: Text("I can't decide")
      ),
      SizedBox(height: 10),
      Text("You voted " + (_numberOfVotes-1).toString() + " ideas")
    ];
  }

  @override
  Widget build(BuildContext context) {
    fetchNewQuestion();

    return Scaffold(
        appBar: AppBar(
          title: Text('Knorket Survey App')
        ),
        body: Column(children: _survey())
    );
  }
}