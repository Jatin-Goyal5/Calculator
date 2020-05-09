import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.white,
        brightness: Brightness.light,
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var first,second ,operation,result,textDisplay,userseen;
  void onbtnclicked(String btnval){
        if(btnval== "C"){
          first = 0;
          second = 0;
          result ="";
          textDisplay= "";
          operation ="";
          userseen ="";
        }else if(btnval =="+" || btnval == "-" || btnval == "/" || btnval == "X" ){
          first = int.parse(textDisplay);

          result ="";
          operation = btnval;


        }else if(btnval == "="){
          second = int.parse(textDisplay);
          if( operation == "+"){
            result = (first+ second).toString();

          } if( operation == "-"){
            result = (first- second).toString();

          } if( operation == "/"){
            result = (first/ second).toString();

          } if( operation == "X"){
            result = (first* second).toString();

          } if( operation == "%"){
            result = (first%second).toString();

          }
        }else{
          result = int.parse(textDisplay + btnval).toString();
        }
        setState(() {
          textDisplay = result;
        });
  }

  Widget customButton(String btnid){
    return new Expanded(child:
    new OutlineButton(child: Text("$btnid"),
        color: Colors.white,
        padding: EdgeInsets.all(25.0),
        onPressed: ()=>onbtnclicked(btnid))
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Calculator', ),elevation: 30.0, bottomOpacity: 30.0,),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget>[
          new Expanded(child: new Container (child:Text("$userseen",style: TextStyle(fontSize: 50.0,),),height: 100.0,
            alignment: Alignment.bottomRight,padding: EdgeInsets.only(bottom: 20.0),
          ),
          ),

           new Expanded(child: new Container (child:Text("$textDisplay",style: TextStyle(fontSize: 50.0,),),height: 100.0,
                          alignment: Alignment.bottomRight,padding: EdgeInsets.only(bottom: 20.0),
                ),
       ),
          new Row(
            children: <Widget>[
              customButton("C"),
              customButton("/"),
              customButton("X"),
              customButton("<--"),

            ],
          ),
          new Row(
            children: <Widget>[
              customButton("7"),
              customButton("8"),
              customButton("9"),
              customButton("-"),

            ],
          ),
          new Row(
            children: <Widget>[
              customButton("4"),
              customButton("5"),
              customButton("6"),
              customButton("+"),

            ],
          ),
          new Row(
            children: <Widget>[
              customButton("1"),
              customButton("2"),
              customButton("3"),
              customButton(" "),
            ],
          ),
          new Row(
            children: <Widget>[
              customButton("%"),
              customButton("0"),
              customButton("."),
              customButton("="),

            ],
          )
      ]
      )

    );
  }
}

