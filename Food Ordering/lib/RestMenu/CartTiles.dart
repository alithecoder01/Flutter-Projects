import 'package:flutter/material.dart';
import 'package:project427/Pages/Cart.dart';
import 'package:project427/models/Restaurant.dart';


class CartTiles extends StatefulWidget{
  CartTiles({
    required this.dish,
    required this.RerenderParent,
    required this.cart
});
  late final OrderDishDto dish;
  late final VoidCallback RerenderParent;
  late final OrderDto cart;
  @override
  State<CartTiles> createState() => _CartTilesState();
}

class _CartTilesState extends State<CartTiles> {

  void incrementCount(){
    setState(() {
      widget.dish.Quantity = (widget.dish.Quantity)! + 1;
      print(widget.dish.Quantity);

    });
    widget.RerenderParent();
  }
  void decrementCount(){
    setState(() {
      widget.dish.Quantity = (widget.dish.Quantity)! - 1;
      print(widget.dish.Quantity);
      if(widget.dish.Quantity==0){
        widget.cart.Dishes.remove(widget.dish);
      }
    });
    widget.RerenderParent();
  }



  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: const EdgeInsets.only(top:8, right: 8, left: 8),
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow:[
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 0),
            ),
          ]
      ),
      child: Container(
        margin: EdgeInsets.only(top: 13),
        child: ListTile(
          title: Text("Beef Burger", style: TextStyle(fontSize: 20),),
          subtitle: Text("Beef Burger", style: TextStyle(fontSize: 15),),
          leading: Image.asset('asset/burger.png'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.dish.Price.toString()+ " BD"),
              Container(
                margin: EdgeInsets.only(top:9),
                width: 98,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 38,
                      height: 22,
                      child: ElevatedButton(
                          onPressed: incrementCount,
                          child: Text("+"),
                      ),
                    ),
                    Text(widget.dish.Quantity.toString()),
                    SizedBox(
                      width: 38,
                      height: 22,
                      child: ElevatedButton(
                        onPressed: decrementCount,
                        child: Text("-"),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
