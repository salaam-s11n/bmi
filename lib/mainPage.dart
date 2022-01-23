// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isMale = true;
  double hightVal = 50;
  double waight = 25;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Body Mass Index",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(child: m1Widgit(context, 'male')),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: m1Widgit(context, 'female')),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.lightBlueAccent, width: 1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$hightVal",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              "  cm",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Slider(
                              min: 50,
                              max: 220,
                              divisions: 170,
                              thumbColor: Colors.lightBlueAccent,
                              activeColor: Colors.lightBlueAccent,
                              inactiveColor: Colors.grey[200],
                              value: hightVal,
                              onChanged: (val) {
                                setState(() {
                                  hightVal = val;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: m2Widgit(context, 'weight')),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: m2Widgit(context, 'age')),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Colors.lightBlueAccent, width: 1)),
                child: TextButton(
                  onPressed: () {
                    var result = waight / pow(hightVal / 100, 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        result: result,
                        isMale: isMale,
                        age: age,
                        hightVal: hightVal,
                        wight: waight,
                      );
                    }));
                  },
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector m1Widgit(BuildContext context, String type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = type == "male" ? true : false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: (isMale && type == "male" || !isMale && type == "female")
                    ? Colors.lightBlueAccent
                    : Colors.white,
                width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(type == "male" ? Icons.male_rounded : Icons.female_rounded,
                color: Theme.of(context).iconTheme.color, size: 50),
            SizedBox(
              height: 10,
            ),
            Text(
              type == "male" ? "Male" : "Female",
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }

  Container m2Widgit(BuildContext context, String type) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.lightBlueAccent, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              type == "weight" ? "Weight" : "Age",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  type == "weight" ? "$waight" : "$age",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  type == "weight" ? " Kg" : " Years",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == "weight" ? "waight --" : "age --",
                  onPressed: () {
                    setState(() {
                      if (age != 0 && waight != 0) {
                        type == "weight" ? waight-- : age--;
                      }
                    });
                  },
                  backgroundColor: Colors.lightBlueAccent,
                  child: Icon(Icons.remove),
                  mini: true,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                FloatingActionButton(
                  heroTag: type == "weight" ? "waight ++" : "age ++",
                  onPressed: () {
                    setState(() {
                      if (age != 0 && waight != 0) {
                        type == "weight" ? waight++ : age++;
                      }
                    });
                  },
                  backgroundColor: Colors.lightBlueAccent,
                  child: Icon(Icons.add),
                  mini: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
