import 'package:flutter/material.dart';



class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Manual Address',
      theme: ThemeData(
        primarySwatch: Colors.red,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Add Manual Address'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class Area{
  int id;
  String name;

  Area(this.id, this.name);

  static List<Area> getAreas(){
    return <Area>[
      Area(1, 'North Karachi'),
      Area(2, 'North Nazimabad'),
      Area(3, 'Gulshan-e-Iqbal'),
      Area(4, 'Gulistan-e-Jauhar'),
      Area(5, 'Shahra-e-Faisal'),
      Area(6, 'DHA Karachi'),
      Area(7, 'Clifton Karachi'),
    ];
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //final _formKey = GlobalKey<FormState>();
  //final _passwordController = TextEditingController();
  //final _confirmPasswordController = TextEditingController();

  @override
  //void dispose() {
  //_passwordController.dispose();
  //  _confirmPasswordController.dispose();
  //  super.dispose();
  //}

  List<Area> _areas = Area.getAreas();
  List<DropdownMenuItem<Area>> _dropdownMenuItems;
  Area _selectedArea;

  @override
  void initState(){
    _dropdownMenuItems = buildDropdownMenuItems(_areas);
    _selectedArea = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Area>> buildDropdownMenuItems(List areas){
    List<DropdownMenuItem<Area>> items = List();
    for (Area area in areas){
      items.add(
        DropdownMenuItem(
          value: area,
          child: Text(area.name),
        ),
      );
    }
    return items;
  }
  onChangeDropdownItem(Area selectedArea){
    setState(() {
      _selectedArea = _selectedArea;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 10.0,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Select your Location"),
              SizedBox(height: 20.0,),
              DropdownButton(
                value: _selectedArea,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              SizedBox(height: 20.0,),
              Text('Selected: ${_selectedArea.name}'),
            ],
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //onPressed: () {
      //if (_formKey.currentState.validate()) {
      //debugPrint('All validations passed!!!');
      // }
      // },
      //child: Icon(Icons.done),
      //),
    );
  }

  Form _buildForm() {
    return Form(
      //key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Deliver To:',
                style: TextStyle(fontSize: 20)
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Username cannot be empty';
                } else if (value.length < 3) {
                  return 'Username must be at least 3 characters long.';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              // controller: _passwordController,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Password cannot be empty';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long.';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              // controller: _confirmPasswordController,
              // validator: (String value) {
              // if (value != _passwordController.value.text) {
              // return 'Passwords do not match!';
              //}
              //return null;
              //},
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
