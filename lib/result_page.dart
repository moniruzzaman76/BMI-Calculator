import 'package:flutter/material.dart';
import 'constants.dart';

class MyResult extends StatelessWidget {
  final double result;
  const MyResult({Key? key, required this.result}) : super(key: key);

  String getStatus(){
    String Status = "";
    if(result<16){
       Status = underWeight;
    }
    else if(result >= 16.0 && result <=16.9 ){
      Status = underWeightModerate;
    }
    else if(result >= 17.0 && result <=18.4 ){
      Status = underWeightMild;
    }
    else if(result >= 18.5 && result <=24.9 ){
      Status =normalRange;
    }
    else if(result >= 25.0 && result <=29.9 ){
      Status = overWeightPreObese;
    }
    else if(result >= 30.0 && result <=29.9 ){
      Status = obeseClass1;
    }
    else if(result >= 35.0 && result <=39.9 ){
      Status = obeseClass2;
    }
    else{
      Status = obeseClass3;
    }
    return Status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text('BMI Result'),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Your Bmi is',style: TextStyle(fontSize:30),),
              Text(result.toStringAsFixed(2), style: const TextStyle(fontSize: 40)),
              const SizedBox(height: 10,),
              const Text('Your are',style: TextStyle(fontSize:30),),
               Text(getStatus(),style: const TextStyle(fontSize: 20,color: Colors.lightBlueAccent),),
              const SizedBox(height: 20,),
              const Text('BMI Basic Categories',style: TextStyle(fontSize:35),),

          Column(
            children: bmiMap.entries.map((entry) => ListTile(
              tileColor: getStatus() == entry.key && result < 16.0 ? Colors.red
                  :getStatus() == entry.key && result >= 16.0 && result <= 16.9 ? Colors.amber
                  : getStatus() == entry.key && result >= 17.0 && result <= 18.4 ? Colors.green
                  : getStatus() == entry.key && result >= 18.5 && result <= 24.9 ? Colors.blue
                  : getStatus() == entry.key && result >= 25.0 && result <= 29.9 ? Colors.pinkAccent
                  : getStatus() == entry.key && result >= 30.0 && result <= 34.9 ? Colors.blueGrey
                  : getStatus() == entry.key && result >= 35.0 && result <= 39.9 ? Colors.black
                  : getStatus() == entry.key && result >= 40.0 ? Colors.red
                  : null,
              title: Text(entry.key, style: TextStyle(
                  fontWeight: entry.key == categories ? FontWeight.bold
                      : null,
                ),
              ),
              trailing: Text(entry.value),
            )).toList(),
          )
            ],
          ),
        ),
      ),
    );
  }
}
