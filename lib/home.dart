import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandooray/auth.dart';
import 'package:tandooray/chicken_burger_tunnel.dart';
import 'package:tandooray/crunchy_tunnel.dart';
import 'package:tandooray/fries_tunnel.dart';
import 'package:tandooray/main.dart';
import 'package:tandooray/my_provider.dart';
import 'cart_page.dart';
import 'beef_burger_tunnel.dart';
import 'chinese_tunnel.dart';
import 'wrap_and_sandwich.dart';
import 'fries_tunnel.dart';
import 'package:tandooray/categories_model.dart';


class Home extends StatelessWidget {
  final appTitle = 'Deliver To:';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  List<CategoriesModel> burgerList=[];






  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getCategories();
    burgerList = provider.throwList;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.red,
          centerTitle:true,

          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.add_shopping_cart),
                  //SizedBox(width: 10.0)

                ],
              ),
              textColor: Colors.white,
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>CartPage()));
              },
            )
          ],

        ),

        body: Container(
          child: ListView(children: [
            LimitedBox(
              maxHeight: 250,
              child: PageView(children: [
                AdsSlideCard(slideImage: "assets/slider1.JPG",
                ),
                AdsSlideCard(slideImage: "assets/slider2.JPG",
                ),
                AdsSlideCard(
                  slideImage: "assets/slider3.JPG",
                )
              ],),
            ),
            GridView.count(crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Menufeature(iconAssets: "assets/s1.png",name: "Fries"),



                Menufeature(iconAssets: "assets/s2.png",name: "Burger"),
                Menufeature(iconAssets: "assets/s3.png",name: "Chinese"),
                Menufeature(iconAssets: "assets/s4.png",name: "Sandwich"),
                Menufeature(iconAssets: "assets/s5.png",name: "Beverage"),
                Menufeature(iconAssets: "assets/s6.png",name: "Deals"),
                Menufeature(iconAssets: "assets/s7.png",name: "Pizza"),
                Menufeature(iconAssets: "assets/s8.png",name: "Crunch")
              ],
            ),

            Container(color: Colors.grey[200],
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Trending Now",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LimitedBox(
                maxHeight: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TrendingCard(
                      image: "assets/t1.JPG",
                    ),
                    TrendingCard(
                      image: "assets/t2.JPG",
                    ),
                    TrendingCard(
                      image: "assets/t3.JPG",
                    ),
                    TrendingCard(
                      image: "assets/t4.JPG",
                    )],
                ),
              ),
            ),
            Container(color: Colors.grey[200],
              height: 8,
            ),
            PromoteShopCard(
              image: "assets/p2.JPG",
            ),
            PromoteShopCard(
              image: "assets/p1.JPG",
            )
          ],
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/slider1.JPG'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              ListTile(
                title: Text('MENU'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('BEEF BURGER TUNNEL'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>beef()));

                },
              ),
              ListTile(
                title: Text('CHINESE TUNNEL'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Chinese()));
                },
              ),
              ListTile(
                title: Text('CHICKEN BURGER TUNNEL'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Chicken()));
                },
              ),
              ListTile(
                title: Text('CRUNCHY TUNNEL'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Crunchy()));
                },
              ),
              ListTile(
                title: Text('WRAP AND SANDWICH'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Sandwich()));
                },
              ),
              ListTile(
                title: Text('FRIES TUNNEL'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Fries()));
                },
              ),
              ListTile(
                title: Text('HOT DEALS'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('POP UP DEALS'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('ORDER HISTORY'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('ORDER TRACKING'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('LOGOUT'),
                onTap: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu),title: Text("Menu")),
            BottomNavigationBarItem(icon: Icon(Icons.history),title: Text("Order History")),
          ],),
    );
  }
}
class PromoteShopCard extends StatelessWidget {
  final String image;
  PromoteShopCard({this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image, fit: BoxFit.cover,),
        ),
      ),
    );
  }
}


class TrendingCard extends StatelessWidget {
  final String image;
  TrendingCard({this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 200,
        width: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


class Menufeature extends StatelessWidget {
  final String iconAssets;
  final String name;
  Menufeature({this.iconAssets,this.name,});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 45, height: 45,
                child: Image.asset(iconAssets)),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class AdsSlideCard extends StatelessWidget {
  final String slideImage;
  AdsSlideCard({this.slideImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(slideImage, fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
