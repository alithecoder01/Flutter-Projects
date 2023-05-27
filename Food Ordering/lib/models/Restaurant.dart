

 class RestaurantDto {

   RestaurantDto({
      required this.Imageurl,
     required this.RestaurantId,
     required this.RestaurantName,
     required this.Description,
     required this.Dishes,
 });
   List<DishDto> Dishes = [];
   String Imageurl;
   int RestaurantId;
   String RestaurantName ;
   String Description ;
}

 class DishDto {
   String Imageurl;
   int Id ;
   String Name;
   String Description ;
   double Price;


   DishDto({
     required this.Id,
     required this.Imageurl,
     required this.Name,
     required this.Description,
     required this.Price,
   });


}

 class OrderDishDto extends DishDto{
 int? Quantity;

  OrderDishDto({required super.Id, required super.Imageurl, required super.Name, required super.Description, required super.Price, required this.Quantity});
}

 class OrderDto {
   int Id =0;
   List<OrderDishDto> Dishes =[];

   OrderDto({
     required this.Id,
     required this.Dishes
 });
}