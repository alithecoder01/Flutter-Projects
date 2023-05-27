import 'dart:math';
import 'package:flutter/material.dart';


class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
    int leftImg = 1;
    int rightImg = 4;
    String message = "Try again";
    @override
    Widget build(BuildContext context) {

      void movement(){
        setState((){
          Random r = Random();

          int y;
          y=r.nextInt(8)+1;
          rightImg=y;

          int x;
          x=r.nextInt(8)+1;
          print(x);
          leftImg=x;
        });

        leftImg == rightImg ? message="You Wooon !" :message= "Try Again";

      }
      
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Text(message,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white54,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  //flex: 1,
                  child: FlatButton(
                    onPressed: () {
                      movement();
                      print("Left clicked");
                    },
                    child: Image.asset("images/image-$leftImg.png"),
                  ),
                ),
                Expanded(
                  //flex: 1,
                  child: FlatButton(
                    onPressed: () {
                      movement();
                      print("Right clicked");

                    },
                    child: Image.asset("images/image-$rightImg.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

