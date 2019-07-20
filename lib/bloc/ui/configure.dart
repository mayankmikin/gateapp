import 'package:flutter/material.dart';
import 'package:gateapp/bloc/repository/gatebloc.dart';
import 'package:gateapp/bloc/services/gatehttp.dart';

class GateConfig extends StatefulWidget {
  @override
  _GateConfigState createState() => _GateConfigState();
}

class _GateConfigState extends State<GateConfig> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configure')),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
           Text('192.168.'),
           new Padding(padding: new EdgeInsets.only(top: 15.0)),
           TextFormField(
              decoration: InputDecoration(labelText: "Enter last 2 digits of ip address"),
              controller: myController,
              validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter IP';
              }
              return null;
            },
           ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                
                Navigator.pop(context);
                toggle.changeIP(myController.text);  
              }
              
             ),
           ),
           ],
          ),
          ),
        ],
      ),
    );
  }
}