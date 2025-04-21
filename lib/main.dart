import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_package/counter_model.dart';
void main(){
  //acts as a bridge between myApp and counter class
  //allows widgets access counter class
  //and listens to its changes
  //creates instance of counter class
  //so that widgets can
  runApp(ChangeNotifierProvider(create:(_)=>Counter(),
    child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),

    );
  }
}
class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    //create instance of counter model
    var counter=Provider.of<Counter>(context);
    return Scaffold(appBar: AppBar(title: Text('Provider package'),centerTitle: true,backgroundColor: Colors.blue.shade300,),
    body:Container(
      padding: EdgeInsets.all(10),

      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          ElevatedButton(onPressed:() {
            counter.increment();

          },style:ElevatedButton.styleFrom(backgroundColor: Colors.green), child:Text('Add')),
          SizedBox(width: 30,),
          ElevatedButton(onPressed:() {
            counter.reset();

          },style:ElevatedButton.styleFrom(backgroundColor: Colors.red),child:Text('Reset'))
        ],),
        Center(child: Consumer<Counter>(builder:(context,counter,child){
          return Text('Count: ${counter.count}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);

        }),)

      ],
    ),)
    );
  }

}