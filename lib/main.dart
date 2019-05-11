import 'package:flutter/material.dart';

void main () => runApp(MaterialApp(
    home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    AppBar appBar = AppBar(
      
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: (){},)
      ],
    );

    Icon icon = Icon(Icons.wb_sunny, size: 120, color: Colors.yellow,);

    TextStyle styleDecoration = TextStyle(color: Colors.blueAccent,fontSize: 20);
    TextStyle styleField = TextStyle(color: Colors.blueAccent);

    RaisedButton raisedButton = RaisedButton(
        onPressed: (){},
      child: Text("Cacular"),
      color: Colors.blueAccent,
    );

    TextField tempCelsius = TextField(keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Temperatura em graus Celsius"),
      textAlign: TextAlign.center,
    );
    TextField tempFahreheit = TextField(keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Temperatura em graus Fahreheit"),
      textAlign: TextAlign.center,
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        icon, tempCelsius, tempFahreheit,raisedButton
      ],
    );
    
    Scaffold scaffold = Scaffold(
    appBar: appBar,
      body: column,
    );
    
    return scaffold;
  }
}
