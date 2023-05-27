import 'package:flutter/material.dart';
import 'package:project427/Pages/Cart.dart';
import '../ResList.dart';
import '../models/Restaurant.dart';
import 'package:carousel_slider/carousel_slider.dart';


class RestaurantsPage extends StatefulWidget {
   RestaurantsPage({Key? key}) : super(key: key);

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {

  List<RestaurantDto> RstDto =[
    RestaurantDto(
        Imageurl: "asset/logo_24746_1673530576.png",
        RestaurantId: 1,
        RestaurantName: "Al Shoola",
        Description: "Al Shoola Res is one of the best res in Bahrain",
        Dishes: [
          DishDto(
            Id: 1,
            Imageurl: "asset/burger.png",
            Name: "Burger",
            Description: "Burger with fries",
            Price: 13.0,
          ),
        ],
    ),
    RestaurantDto(
      Imageurl: "asset/logo_24746_1673530576.png",
      RestaurantId: 1,
      RestaurantName: "Al Shoola",
      Description: "Al Shoola Res is one of the best res in Bahrain",
      Dishes: [
        DishDto(
          Id: 1,
          Imageurl: "asset/burger.png",
          Name: "Burger",
          Description: "Burger with fries",
          Price: 13.0,
        ),
      ],
    ),
  ];

  List<RestaurantDto> RstDtoUrl =[
    RestaurantDto(
      Imageurl: "asset/logo_24746_1673530576.png",
      RestaurantId: 1,
      RestaurantName: "Al Shoola",
      Description: "Al Shoola Res is one of the best res in Bahrain",
      Dishes: [
        DishDto(
          Id: 1,
          Imageurl: "asset/burger.png",
          Name: "Burger",
          Description: "Burger with fries",
          Price: 13.0,
        ),
      ],
    ),
    RestaurantDto(
      Imageurl: "asset/logo_24746_1673530576.png",
      RestaurantId: 1,
      RestaurantName: "Al Shoola",
      Description: "Al Shoola Res is one of the best res in Bahrain",
      Dishes: [
        DishDto(
          Id: 1,
          Imageurl: "asset/burger.png",
          Name: "Burger",
          Description: "Burger with fries",
          Price: 13.0,
        ),
      ],
    ),
    RestaurantDto(
      Imageurl: "asset/logo_24746_1673530576.png",
      RestaurantId: 1,
      RestaurantName: "Al Shoola",
      Description: "Al Shoola Res is one of the best res in Bahrain",
      Dishes: [
        DishDto(
          Id: 1,
          Imageurl: "asset/burger.png",
          Name: "Burger",
          Description: "Burger with fries",
          Price: 13.0,
        ),
      ],
    ),
    RestaurantDto(
      Imageurl: "asset/logo_24746_1673530576.png",
      RestaurantId: 1,
      RestaurantName: "Al Shoola",
      Description: "Al Shoola Res is one of the best res in Bahrain",
      Dishes: [
        DishDto(
          Id: 1,
          Imageurl: "asset/burger.png",
          Name: "Burger",
          Description: "Burger with fries",
          Price: 13.0,
        ),
      ],
    ),
  ];

  void Rerender(){
    setState(() {

    });
  }

  OrderDto cart = new OrderDto(
    Id: 0,
    Dishes: []
  );

  String getQuantity(){
    int quantity =0;
    for (int x =0; x<cart.Dishes.length; x++){
      quantity+=cart.Dishes[x].Quantity!;
    }
    return quantity.toString();
}

  int _current = 0;
  final CarouselController _controller = CarouselController();

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
                  child: const Text("Restaurants",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),

                InkWell(
                  onTap: ()=> {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart(cart: cart,RerendeParent: Rerender,)))
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
          CarouselSlider(
            carouselController: _controller,
            options:
            CarouselOptions(
              height: 250.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              onPageChanged: (index, reason) {
              setState(() {
              _current = index;
              });
              },

            ),
            items: RstDtoUrl.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(i.Imageurl)
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: RstDtoUrl.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          Expanded(

            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),

              child: ListView.builder(
                itemCount: RstDto.length,
                itemBuilder: (BuildContext context, int index) {
                  return ResList(
                    restaurent: RstDto[index],
                    cart: cart,
                    RerenderParent: Rerender,
                  );
                },
              ),
            ),
          ),
        ],
      ),

    );
  }
}



