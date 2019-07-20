import 'package:flutter/material.dart';
import 'package:gateapp/bloc/repository/gatebloc.dart';
import 'package:gateapp/bloc/ui/configure.dart';

class GatePage extends StatefulWidget {
  @override
  _GatepageState createState() => _GatepageState();
}

class _GatepageState extends State<GatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gate')),
      body: Center(
        child: StreamBuilder(
          stream: bloc.listenStreamGate,
          initialData: bloc.status,
          builder: (context, snapshot){
            return Column(
               children: <Widget>[
                 new Padding(padding: new EdgeInsets.only(top: 30.0)),
                 Text('GateStatus'),
                 RaisedButton(
                   child: Text('${bloc.status}'),
                  onPressed: (){
                    bloc.changeStatus();
                  },
                 ),
                 new Padding(padding: new EdgeInsets.only(top: 50.0)),
                 RaisedButton(
                   child: Text('Configure'),
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>GateConfig()),
                    );
                  },
                 ),
               ],
            );
          },
        ),
      ),
    );
  }
}