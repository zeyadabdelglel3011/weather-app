import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(

          height: 150,
          width: 200,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg'),)
          ),
        ),


      ],
    );
  }
}
