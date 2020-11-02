import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/countController.dart';
import 'package:getx_test/second.dart';

import 'controllers/userController.dart';

void main() {
  runApp(GetMaterialApp(
    home: HomePage(),

    
  ));
}

class HomePage extends StatelessWidget {
  final CountController _countController = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GetBuilder<CountController>
                (builder: (_){
                  return Text("Counter Value is ${_.count}");
              }),

            ),
            SizedBox(
              height: 10,
            )
            ,
            GetX<UserController>(
              init:
              UserController(), // can initialize inside GetX instead of .put
              builder: (_) => Text('Name: ${_.user.value.name}'),
            ),
            Obx(
              //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
                  () => Text(
                  'Stored Count: ${Get.find<UserController>().user.value.count}'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Update Name & Stored Count"),
              onPressed: () {
                Get.find<UserController>().updateUser(Get.find<
                    CountController>()
                    .count); //using Get.find locates the controller that was created in 'init' in GetX
              },
            ),

            SizedBox(
              height: 20,
            ),

            FloatingActionButton(
              heroTag: "Button1",
              child: Icon(
                Icons.add
              ),
                onPressed: (){
                  _countController.increment();

                }

            ),
            SizedBox(
              height: 20,
            ),

            FloatingActionButton(onPressed: (){
              Get.to(SecondScreen());
            },
              child: Icon(
                Icons.arrow_forward
              ),
              heroTag: "Button2",

            )
          ],
        ),
      ),
    );
  }
}

