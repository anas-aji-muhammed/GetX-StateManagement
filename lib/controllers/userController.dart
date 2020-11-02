import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_test/models/user.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateUser(int count) {
    //Which is better??

    //Option #1
    // user().name = "Tadas";
    // user().count = count;

    //Option #2
    user.update((value) {
      value.name = 'Anas Aji Muhammed';
      value.count = count;
    });
  }
}