import 'package:flutter/material.dart';
import 'package:weather_app/presentation/components/home_item.dart';

class Design extends StatelessWidget {
  const Design({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.shopping_cart,
                        size: 35.0,
                      ),
                    ),
                    Column(


                    //  crossAxisAlignment: CrossAxisAlignment.end,
                    //  mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          'عنوان التوصيل',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,


                          ),
                        ),
                       Row(
                         children: [
                           Icon(
                               Icons.arrow_drop_down
                           ),
                           Text(
                             '..الرياض , الرياض',
                             style: TextStyle(

                               fontSize: 20.0,
                             ),
                           ),

                         ],
                       ),
                      ],
                    ),
                  ],
                ),
              ),
              TextField(

                decoration: InputDecoration(

                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.search,

                  ),
                  label: Text(
                    'البحث..'
                  ),


                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(

                height: 100,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent[100],


                ),

              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Image(


                      image: NetworkImage('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg')
                    ,),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عرض الكل',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red
                    ),
                  ),
                  Text(
                    'التصنيفات',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 20.0,
              ),
             SizedBox(
               height: 200.0,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                   itemBuilder:(context,index){
                     return HomeItem();
                   } , separatorBuilder: (context, index){
                     return SizedBox(
                       width: 10.0,
                     );
               }
                   , itemCount: 5),
             )
            ],
          ),
        ),

      ),

    );
  }
}
