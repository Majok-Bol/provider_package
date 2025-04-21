//handle counter
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
//this class will use change notifier mixin to
//alert listeners of changes
//in its state
class Counter with ChangeNotifier{
  //keep track of counts
  int _count = 0;
//getter for the count
//expose private variable to outside
//allows other widgets to get current value of the count
//but cannot modify it directly
//because it is a getter
int get count=>_count;

void increment(){
  _count++;
  //alert listeners of changes
  //rebuild the UI
  notifyListeners();
}
//reset
void reset(){
  _count=0;
  notifyListeners();
}


}