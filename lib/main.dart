import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _reserFields() {
      celsiusController.text = "";
      fahrenheitController.text = "";
    }

    void _converter() {
      double celsius = double.parse(celsiusController.text);
      double fahrenheit = celsius * 1.8 + 32.0;
      fahrenheitController.text = fahrenheit.toStringAsFixed(4);
    }

    AppBar appBar = AppBar(
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _reserFields,
        ),
      ],
    );

    /*Icon icon = Icon(
      Icons.wb_sunny,
      size: 120,
      color: Colors.yellow,
    );*/
    Image imgLogo = Image.asset("assets/images/logo.png",height: 120,width: 120,);

    TextStyle styleDecoration =
        TextStyle(color: Colors.blueAccent, fontSize: 20);
    TextStyle styleField = TextStyle(color: Colors.blueAccent);

    RaisedButton raisedButton = RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _converter();
        }
      },
      child: Text("Cacular"),
      color: Colors.blueAccent,
    );

    Container containerBtn = Container(
      height: 200.0,
      child: raisedButton,
    );

    Padding padding = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: containerBtn,
    );

    TextFormField tempCelsius = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Temperatura em graus Celsius",
        labelStyle: styleDecoration,
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: celsiusController,
       validator: (value){
        if (value.isEmpty){
          return "Informe um valor";
        }
      },
    );

    TextFormField tempFahreheit = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Temperatura em graus Fahreheit",
        labelStyle: styleDecoration,
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: fahrenheitController,
     validator: (value){
          if (value.isEmpty){
            return "Informe um valor";
          }
        },
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        imgLogo, tempCelsius, tempFahreheit, padding
      ],
    );

    Form form = Form(child: column, key: _formKey);

    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: form,
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    );

    Scaffold scaffold = Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: singleChildScrollView);

    return scaffold;
  }
}
