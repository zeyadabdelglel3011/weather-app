import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/components/home_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Container(
                
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.shopping_cart,
                              size: 35.0,
                            ),
                          ),
                          Column(
              
                            children: [
                              Text(
                                'عنوان التوصيل',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
              
              
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
                                        fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
              
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0),)
                          ),
                          prefixIcon: Icon(Icons.search,),
                          label: Text(
                            'Search..',
                            style: TextStyle(
              
                            ),
                          ),
              
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 100,
                        width: 370,
              
                        decoration:BoxDecoration(
                            color: Colors.pink[50],
                          borderRadius: BorderRadius.all(Radius.circular(16.0))
              
                        ) ,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                  '#CODE11',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                  ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Icon(
                                    CupertinoIcons.clock,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              Text(
                                '..العرض الخاص بك شارف علي الانتهاء',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
              
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 220,
                        width: 370,
                        decoration:
                        BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.all(Radius.circular(20.0),)
              
                        ),
                        child: Image(image:
                        NetworkImage('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg'),
              
                        ),
                      ),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'عرض الكل',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.red,
              
                            ),
                          ),
                          Text(
                            'التصنيفات',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
              
                        ],
                      ),

                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return HomeItem();
                            },
                            separatorBuilder: (context,index){
                             return SizedBox(width: 20,);
                            },
                            itemCount: 10),
                      )
              
                    ],
                  ),
                ),
            ),
            ),
          
    );
  }
}
