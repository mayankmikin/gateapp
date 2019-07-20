import 'package:http/http.dart';

class FetchData{
  String address;
  
  statusOn() async {
    var result = await get('http://192.168.'+this.address+'/toggle/id?op=0&id=16');
    return result.body;
  }
  statusOff() async{
    //var result = await get('http://192.168.0.2/toggle/id?op=1&id=16');
    var result = await get('http://192.168.'+this.address+'/toggle/id?op=1&id=16');
    return result.body;
  }

  changeIP(var ip){
    this.address = ip;
    return this.address;
  }
}
final FetchData toggle = new FetchData();