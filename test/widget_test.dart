// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:unit_test_tutorial/main.dart';
import 'package:unit_test_tutorial/util_model.dart';

void main() {

  Utils myUtil = Utils();

  group("Value testing passed", () {

    test("Base Url is Not Empty", () {
      expect(myUtil.baseUrl.isNotEmpty, true);
    });

    test("myNumber's initial value equals to 100", () {
      expect(myUtil.myNumber, 100);
    });

  });


  group("Methods testing", () {

    test("isMaxNew method testing", () {
      for(int i = 0; i<10;i++){
        // expect(myUtil.isMaxNew(i*10, 100, 11400, i.isEven?true:false), true);
        expect(myUtil.isMaxNew(10, 100, 11400,true), true);
      }
    });

    test("string equality testing", () {
      expect(myUtil.stringEquals("Sa Lo m", "Salom"), true);
    });

    test("Test formatting",() {
      expect(Utils.format(11), 11.toString());
    },);

    test("Card formatting test",() {
      expect(myUtil.returnCardFormatText("1111222233334444"), "1111 2222 3333 4444");
    },);

  });



}

class Utils{


  String baseUrl = "https://kun.uz";

  int myNumber = 100;


  bool isMaxNew(int amount, int maxAmount, double rate, bool isDollar) {
    if (isDollar) {
      return maxAmount < rate * amount;
    } else {
      return maxAmount < amount;
    }
  }




  bool stringEquals(String main, String sub) {
    if (main.replaceAll(" ", "").length < sub.replaceAll(" ", "").length) {
      return false;
    } else {
      if ((main
          .replaceAll(" ", "")
          .substring(0, sub.replaceAll(" ", "").length)
          .toUpperCase()) ==
          sub.replaceAll(" ", "").toUpperCase()) {
        return true;
      } else {
        return false;
      }
    }
  }


  static String format(int k) {
    if (k < 10) {
      return "0$k";
    } else {
      return k.toString();
    }
  }



  String returnCardFormatText(String cardNumber) {
    String part1 = cardNumber.substring(0, 4);
    String part2 = cardNumber.substring(4, 8);
    String part3 = cardNumber.substring(8, 12);
    String part4 = cardNumber.substring(12, 16);
    return "$part1 $part2 $part3 $part4";
  }
}



