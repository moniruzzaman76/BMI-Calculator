import 'dart:core';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bgColor = const Color(0xff0E0E0E);
  Color cardColor =  Color(0xff28293D);
  bool isMale = true;
  int weight = 50;
  int age = 18;
  int height = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Card(
                        color: isMale == true ? Colors.teal : cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 50,
                            ),
                            Text('Male', style: TextStyle(fontSize: 20, color: Colors.white),)
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  flex: 5,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Card(
                        color: isMale == false ? Colors.teal : cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.female,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text('Female', style: TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),/// 1st Step

          Expanded(
              flex: 10,
              child: Container(
                color: cardColor,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Height',style: TextStyle(fontSize: 30,color: Colors.white),),
                    const SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Text('$height',style: const TextStyle(fontSize: 30,color: Colors.white),),
                       const SizedBox(width:6,),
                       const Text('CM',style: TextStyle(fontSize: 12,color: Colors.white),)
                     ],
                   ),
                    Slider(
                      thumbColor: Colors.pink,
                      activeColor: Colors.teal,
                      inactiveColor: Colors.grey,
                      min: 100,
                        max: 250,
                        value: height.toDouble(),
                        onChanged: (value){
                        setState(() {
                          height = value.toInt();
                        });
                        }),
                  ],
                ),
              )),/// 2nd Step

          Expanded(
              flex: 10,
              child: Card(
                color: bgColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                        child: Container(
                          color: cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(('Weight'),style: GoogleFonts.playfairDisplay(
                                fontSize: 25,
                                color: Colors.white
                              ),),
                               Text("$weight",style: const TextStyle(fontSize: 30,color: Colors.white),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    mini:true,
                                    onPressed:(){
                                      setState(() {
                                        weight++;
                                      });
                                  },child: const Icon(Icons.add),),
                                  const SizedBox(width: 10,),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed:(){
                                      if(weight>1){
                                        setState(() {
                                          weight--;
                                        });
                                      }
                                  },child: const Icon(Icons.remove),),
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                    const SizedBox(width:8,),
                    Expanded(
                        flex: 5,
                        child: Container(
                          color: cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(('Age'),style: GoogleFonts.playfairDisplay(
                                  fontSize: 25,
                                  color: Colors.white
                              ),),
                              Text("$age",style:  const TextStyle(fontSize: 30,color: Colors.white),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    mini:true,
                                    onPressed:(){
                                      setState(() {
                                        age++;
                                      });
                                    },child: const Icon(Icons.add),),
                                  const SizedBox(width: 10,),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed:(){
                                      if(age>1){
                                        setState(() {
                                          age--;
                                        });
                                      }
                                    },child: const Icon(Icons.remove),),
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              )),/// 3rd step

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink
              ),
                onPressed: (){
                  double h  = height/100;
                  double heightSquare = h*h ;
                  double bmiResult = weight/ heightSquare;
                  print('Our Result is:$bmiResult');

                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MyResult(result:bmiResult)));
                },
                child: const Text('Calculate',style: TextStyle(
                  fontSize: 25,
                  fontWeight:FontWeight.bold,
                  color: Colors.white
                ),)
            ),
          )
        ],
      ),
    );
  }
}


