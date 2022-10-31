/* lib/controller/categoryController */


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:finance_app/models/category.dart';

class CategoryController extends GetxController {
  List<Catgory> categoryList = <Catgory>[

    new Catgory(title: "Home", icon: Icon(Icons.favorite)),
    new Catgory(title: "Home", icon: Icon(Icons.favorite)),
    new Catgory(title: "Home", icon: Icon(Icons.favorite)),
    new Catgory(title: "Home", icon: Icon(Icons.favorite)),
    new Catgory(title: "Home", icon: Icon(Icons.favorite)),
    new Catgory(title: "Home", icon: Icon(Icons.favorite)),

  ];

  addCategory(Catgory Catgory){
    categoryList.add(Catgory);
  }
}