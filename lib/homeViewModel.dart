import 'package:flutter/cupertino.dart';

//this is the viewmodel class using change notifier to notify the listners if there is any changes
class HomeViewModel extends ChangeNotifier{
  TextEditingController controller = TextEditingController();

  List<String> _list = ['1','2','3'];

  List<String> get list => _list;

  add(){
    _list.add(controller.text);
    notifyListeners();
  }

  delete(String item){
    _list.removeWhere((element) => element == item);
    notifyListeners();
  }

}