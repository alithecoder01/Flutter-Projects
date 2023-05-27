import 'package:flutter/material.dart';
import 'package:project427/Pages/Restaurants.dart';
import 'package:project427/models/Restaurant.dart';
import '../RestMenu/CartTiles.dart';

class Cart extends StatefulWidget {
  Cart({Key? key, required this.cart,required this.RerendeParent,this.popTwice=false}) : super(key: key);
  bool popTwice=false;
  final OrderDto cart;
  final VoidCallback RerendeParent;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int qun=0;
  void incrementCount(){
    setState(() {
      qun = qun+ 1;
      print("$qun");
    });
  }
  void Rerender(){
    setState(() {

    });
    widget.RerendeParent();
  }
  String getQuantity(){
    int quantity =0;
    for (int x =0; x<widget.cart.Dishes.length; x++){
      quantity+=widget.cart.Dishes[x].Quantity!;
    }
    return quantity.toString();
  }
  String getTotalPrice(){
    double price =0;
    for (int x =0; x<widget.cart.Dishes.length; x++){
      price+=(widget.cart.Dishes[x].Price)*(widget.cart.Dishes[x].Quantity)!;
    }
    return price.toString();
  }

  void chekOut(){
    setState(() {
      widget.cart.Dishes =[];

    });
    widget.RerendeParent();
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Gafsha",
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
        ),
      ),
      ),

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text("Cart",
                    style: TextStyle(
                      fontSize: 20,
                    ),

                  ),
                ),

                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Text(getQuantity()),
                      Icon(Icons.shopping_cart_outlined),
                    ],
                  ),
                ),
              ],
            ),

          ),

          Expanded(

            child: ListView.builder(
              itemCount: widget.cart.Dishes.length,
              itemBuilder: (BuildContext context, int index) {
                return CartTiles(dish: widget.cart.Dishes[index],RerenderParent: Rerender,cart: widget.cart,);
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(

                child: Text("Total:${getTotalPrice()}BD",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),

              Container(
                width: 430,
                height: 65,
                child:
                ElevatedButton(
                    onPressed: () => {
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=> RestaurantsPage())),
                      if(widget.popTwice)
                        Navigator.pop(context, MaterialPageRoute(builder: (context)=> RestaurantsPage())),
                      chekOut()
                    }, child: const Text("Check Out", style: TextStyle(fontSize: 19),)),
              ),
            ],

          ),
        ],
      ),
    );
  }
}