// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
    required this.hightVal,
    required this.wight,
  }) : super(key: key);

  String text = 'data';
  final double result;
  final bool isMale;
  final int age;
  final double hightVal;
  final double wight;

  String get resultPhrase {
    String resultText = "";
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result >= 25 && result < 30) {
      resultText = 'OverWeight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // double boy = hightVal - 100;
    // double girl = hightVal - 110;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          "Result",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: GridView(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlueAccent, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Gender : ${isMale ? "Male" : "Female"}",
                    style: Theme.of(context).textTheme.subtitle2),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlueAccent, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Result : ${result.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlueAccent, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Healthiness : $resultPhrase",
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlueAccent, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Age : $age years",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlueAccent, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  hightVal > 100
                      ? "Perfect weight : ${isMale ? hightVal - 100 : hightVal - 110} Kg"
                      : "Perfect weight:Available for Height 100 or more only",
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlueAccent, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Need Weight to Perfect : ${isMale ? wight > (hightVal - 100) ? wight - (hightVal - 100) : "" : wight > (hightVal - 110) ? wight - (hightVal - 110) : ""} Kg",
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
