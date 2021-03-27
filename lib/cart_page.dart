import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandooray/firebase_database_utilit.dart';
import 'package:tandooray/home.dart';
import 'package:tandooray/my_provider.dart';
import 'package:tandooray/order_data.dart';
import 'home.dart';




class CartPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CartPage>  {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseDatabaseUtil databaseUtil;

  @override
  void initState() {
    super.initState();
    databaseUtil = new FirebaseDatabaseUtil();
    databaseUtil.initState();
  }
  void addUser(User user) {
    setState(() {
      databaseUtil.addUser(user);
    });
  }

  String imgPath;
  String foodName;
  int price ;
  int index;



  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    //final foodName = provider.cartList.toString();

    /*ListView.builder(itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          return CartItem(
            foodName: provider.cartList[index].foodName,
          price: provider.cartList[index].price,
          )*/

    String foodName;
    int price;


    return Scaffold(
      backgroundColor: Colors.red,
      /*appBar: AppBar(
          title: Text('BEEF BURGER TUNNEL'),
          backgroundColor: Colors.red,
          centerTitle:true,

        ),*/

      /*body: children: [

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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
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
                    'CART',
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
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(75.0)),
                ),
                child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(left: 5.0,), //right: 20.0),
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height - 300.0,
                            child: ListView.builder(
                                itemCount: provider.cartList.length,
                                itemBuilder: (ctx, index) {
                                  foodName = provider.cartList[index].foodName;
                                  price = provider.cartList[index].price;
                                  index = provider.getDeleteIndex(index);
                                  return buildFoodItem('',
                                    '$foodName', price,
                                  );

                                }
                            )
                        )
                    ),


                    /* _buildFoodItem('', 'TANDOORAY PHILLY CHEESE STEAK', 550),
                                _buildFoodItem('', 'BURGERETO', 550),
                                _buildFoodItem('', 'SWISS STEAK BURGER', 450),
                                _buildFoodItem('', 'PHILLY CHEESE STEAK', 400),
                                _buildFoodItem('', 'KHAPPA', 500),
                                _buildFoodItem('', 'DOUBLE DRAGON', 400),
                                _buildFoodItem('', 'MUSHROOM MANIA', 380),
                                _buildFoodItem('', 'FIRE BURGER', 350),
                                _buildFoodItem('', 'RANGER BURGER', 300),
                                _buildFoodItem('', 'CHEESY CHAT PATA BEEF', 300),
                                _buildFoodItem('', 'CHAT PATA BEEF', 260),
                                _buildFoodItem('', 'CHEESY CLASSIC', 280),
                                _buildFoodItem('', 'CLASSIC BEEF', 240),*/
                    SizedBox(height: 10),
    Center(
      child: Container(
        width: 120,
      height: 40.0,
      child: Material(
      borderRadius: BorderRadius.circular(5.0),
      shadowColor: Colors.redAccent,
      color: Colors.red,
      elevation: 7.0,
      child: GestureDetector(
      onTap: () {
         addUser;
      },
      child: Center(
      child: Text(
      'CHECK OUT',
      style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat'
      ),
      ),
      ),
      ),
      ),

      ),
    )
                  ],
                )


            ),

          ]

      ),


    );
  }

  Widget buildFoodItem(String imgPath, String foodName, int price) {

    MyProvider provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {},
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
                          '$price',
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
              icon: Icon(Icons.remove),
              color: Colors.black,
              onPressed: () {
                provider.delete();
              },
            )
          ],
        ),
      ),
    );
  }
}




