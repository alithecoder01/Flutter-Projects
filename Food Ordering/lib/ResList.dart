import 'package:flutter/material.dart';
import 'package:project427/Pages/Menu.dart';

import 'models/Restaurant.dart';


class ResList extends StatelessWidget {
   ResList({Key? key, required this.restaurent, required this.cart,required this.RerenderParent} ) : super(key: key);
   final VoidCallback RerenderParent;
   final RestaurantDto restaurent;
   final OrderDto cart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{
        Navigator.push(context,MaterialPageRoute(builder: (context) => Menu(restaurent: restaurent, cart: cart,RerenderParent: RerenderParent,)) ),
      },
      child: Container(

        margin: const EdgeInsets.only(top:20, left: 2, right: 2),
        height: 120,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.5,
                blurRadius:2.5,
                offset: Offset(0,0),
              ),
            ]
        ),
        child: Row(
            children: [
              Image.asset(restaurent.Imageurl),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurent.RestaurantName),
                    Text(restaurent.Description),
                  ],
                ),
              )
            ],
        ),
      ),
    );
  }
}
