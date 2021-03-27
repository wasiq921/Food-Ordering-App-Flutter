import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandooray/cart_model.dart';
import 'package:tandooray/my_provider.dart';
import 'home.dart';


class beef extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<beef> {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //final ValueSetter<CartModel> _valueSetter;

  //beef(this._valueSetter);



  String imgPath;
  String foodName;
  int price ;


  

  @override
  Widget build(BuildContext context) {

    MyProvider provider = Provider.of<MyProvider>(context);




    return Scaffold(
      
      backgroundColor: Colors.red,
      /*appBar: AppBar(
          title: Text('BEEF BURGER TUNNEL'),
          backgroundColor: Colors.red,
          centerTitle:true,

        ),*/
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Home()));
                  },
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /*IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      ),*/
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text(
                  'BEEF BURGER TUNNEL',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 5.0,), //right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: [
                        buildFoodItem('', 'TANDOORAY PHILLY CHEESE STEAK', 550),
                        buildFoodItem('', 'BURGERETO', 550),
                        buildFoodItem('', 'SWISS STEAK BURGER', 450),
                        buildFoodItem('', 'PHILLY CHEESE STEAK', 400),
                        buildFoodItem('', 'KHAPPA', 500),
                        buildFoodItem('', 'DOUBLE DRAGON', 400),
                        buildFoodItem('', 'MUSHROOM MANIA', 380),
                        buildFoodItem('', 'FIRE BURGER', 350),
                        buildFoodItem('', 'RANGER BURGER', 300),
                        buildFoodItem('', 'CHEESY CHAT PATA BEEF', 300),
                        buildFoodItem('', 'CHAT PATA BEEF', 260),
                        buildFoodItem('', 'CHEESY CLASSIC', 280),
                        buildFoodItem('', 'CLASSIC BEEF', 240),
                        SizedBox(height: 10),

                      ],
                    )


                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget buildFoodItem(String imgPath, String foodName, int price){
    MyProvider provider = Provider.of<MyProvider>(context);
    /*List<CartModel> products = [
      CartModel(foodName: foodName, price: price),

    ];*/

    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: (){
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  /*Hero(
                    tag: imgPath,
                    child: Image(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0,
                    ),
                  ),*/
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          foodName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      Text(
                          price.toString(),
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              color: Colors.grey
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),

            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {

                  provider.addToCart(foodName: foodName, price: price);



                }


            )
          ],
        ),
      ),
    );
  }
}