import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/sumController.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SumController>(
              init: SumController(),
              builder: (_){
                return Text('Sum is: ${_.sum}');
              },
            )
          ],
        ),
      ),
    );
  }
}
