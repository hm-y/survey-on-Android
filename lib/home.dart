import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  bool _active = true;

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
    return <Widget>[
      SizedBox(
        height: 150,
        width: double.maxFinite,
        child: Center(child: _textScroll("Question comes here"))
      ),
      SizedBox(height: 10),
      SizedBox(
        height: 100,
        width: double.maxFinite,
        child: FlatButton(
          color: _active ? Colors.blue : Colors.blue[300],
          textColor: Colors.white,
          padding: EdgeInsets.all(3),
          onPressed: () => setState(() { _active = !_active; }),
          child: _textScroll("Option A comes here")
        )
      ),
      SizedBox(height: 10),
      SizedBox(
        height: 100,
        width: double.maxFinite,
        child: FlatButton(
          color: _active ? Colors.blue : Colors.blue[300],
          textColor: Colors.white,
          padding: EdgeInsets.all(3),
          onPressed: () => setState(() { _active = !_active; }),
          child: _textScroll("Option B comes here")
        )
      ),
      OutlineButton(
        color: Colors.grey,
        padding: EdgeInsets.all(10),
        onPressed: () {},
        child: Text("I can't decide")
      ),
      SizedBox(height: 10),
      Text("Statistics")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Knorket Survey App')
        ),
        body: Column(children: _survey())
    );
  }
}