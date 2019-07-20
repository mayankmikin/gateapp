import 'dart:async';
import 'package:gateapp/bloc/services/gatehttp.dart';
import 'package:http/http.dart';

class GateBloc{
  String status = 'Closed';
  String address = null;
  StreamController _streamgate = StreamController.broadcast();
  Stream get listenStreamGate =>_streamgate.stream;

  changeStatus(){
    if (this.status == 'Closed'){
    _streamgate.sink.add(this.status = 'Open');
    toggle.statusOn();
    }
    else{
    _streamgate.sink.add(this.status = 'Closed');
    toggle.statusOff();
    }
  } 
}
final GateBloc bloc = new GateBloc();