import 'package:flutter/material.dart';
import 'package:project427/models/Restaurant.dart';
import '../RestMenu/MenuTiles.dart';
import 'Cart.dart';
class Menu extends StatefulWidget {
   Menu({Key? key, required this.restaurent, required this.cart,required this.RerenderParent}) : super(key: key);

  final RestaurantDto restaurent;
  final OrderDto cart;
  final VoidCallback RerenderParent;
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void Rerender(){
    setState(() {

    });
    widget.RerenderParent();
  }
  String getQuantity(){
    int quantity =0;
    for (int x =0; x<widget.cart.Dishes.length; x++){
      quantity+=widget.cart.Dishes[x].Quantity!;
    }
    return quantity.toString();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gafsha',
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
                  child: const Text("Menu",
                    style: TextStyle(
                      fontSize: 20,
                    ),

                  ),
                ),

                InkWell(
                  onTap: ()=> {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart(cart: widget.cart,RerendeParent: Rerender,popTwice: true,)))
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children:[
                        Text(getQuantity()),
                        Icon(Icons.shopping_cart_outlined),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 250,
            width: 430,
            child: Image.asset(widget.restaurent.Imageurl),
          ),

          Container(
            width: 420,
            height: 450,
            child: ListView.builder(
              itemCount: widget.restaurent.Dishes.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuTiles(dishes: widget.restaurent.Dishes[index], cart: widget.cart,RerenderParent: Rerender,);
              },

            ),
          ),

        ],
      ),

    );
  }
}
