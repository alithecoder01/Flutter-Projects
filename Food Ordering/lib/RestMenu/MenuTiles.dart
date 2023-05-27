import 'package:flutter/material.dart';
import 'package:project427/Pages/Cart.dart';

import '../models/Restaurant.dart';

class MenuTiles extends StatelessWidget {
   MenuTiles({Key? key, required this.dishes, required this.cart, required this.RerenderParent}) : super(key: key);
  final DishDto dishes;
  final OrderDto cart;
  final VoidCallback RerenderParent;

  void addDish(){
    cart.Dishes.add(
        OrderDishDto(
            Id: dishes.Id,
            Imageurl: dishes.Imageurl,
            Name: dishes.Name,
            Description: dishes.Description,
            Price: dishes.Price,
            Quantity: 1)
    );
    RerenderParent();
  }


  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: const EdgeInsets.only(top:8, left: 8, right: 8),
      height: 90,
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
          title: Text(dishes.Name, style: TextStyle(fontSize: 20),),
          subtitle: Text(dishes.Description, style: TextStyle(fontSize: 15),),
          leading: Image.asset(dishes.Imageurl),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dishes.Price.toString() + " BD"),
              Container(
                margin: EdgeInsets.only(top:4),
                  width: 60,
                  height: 28,
                  child: ElevatedButton(
                    onPressed: ()=>{
                      addDish(),
                    },
                    style: ButtonStyle(
                      iconSize: MaterialStateProperty.all(200),
                    ),
                  child: const Text("Add", style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),),
                  ),
              ),
            ],),
        ),
      ),
    );
  }
}
