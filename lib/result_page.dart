import 'package:flutter/material.dart';
import 'constants.dart';

class MyResult extends StatelessWidget {
  final double result;

  const MyResult({super.key, required this.result});
  String getStatus() {
    String status = '';
    if (result < 16.0) {
      status = Underweight;
    } else if (result >= 16 && result <= 16.9) {
      status = UnderweightModerate;
    } else if (result >= 17 && result <= 18.4) {
      status = UnderweightMild;
    } else if (result >= 18.5 && result <= 24.9) {
      status = Normal;
    } else if (result >= 25 && result <= 29.9) {
      status = OverweighPreobese;
    } else if (result >= 30 && result <= 34.9) {
      status = ObeseClass1;
    } else if (result >= 35 && result <= 39.9) {
      status = ObeseClass2;
    } else {
      status = ObeseClass3;
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Your Bmi is', style: TextStyle(fontSize: 30)),
              Text(result.toStringAsFixed(1), style: const TextStyle(fontSize: 40)),
              const Text('You are', style: TextStyle(fontSize: 30)),
              Text(getStatus(), style: const TextStyle(fontSize: 20)),
              const Text('BMI basic categories',
                  style: TextStyle(fontSize: 30)),
              Column(
                children: bimMap.keys.map((value) {
                  bool firstrow = value == Category;
                  return ListTile(
                    tileColor:
                    value == getStatus() && result >= 16 && result <= 16.9 ? Colors.amber
                        : value == getStatus() && result >= 17 && result <= 18.4 ? Colors.green
                        : value == getStatus() && result >= 18.5 && result <= 24.9 ? Colors.blue
                        : value == getStatus() && result >= 25 && result <= 29.9 ? Colors.red
                        : value == getStatus() && result >= 30 && result <= 34.9 ? Colors.blueGrey
                        : value == getStatus() && result >= 35 && result <= 39.9 ? Colors.black : null,
                    title: Text(value, style: TextStyle(
                          fontWeight: firstrow ? FontWeight.bold : null),
                    ),
                    trailing: Text(bimMap[value]!),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
