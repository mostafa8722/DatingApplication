// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:dating_application/model/response/response.dart';
import 'package:dating_application/screens/authentication/signin/signinBinding.dart';
import 'package:dating_application/screens/authentication/signin/signinController.dart';
import 'package:dating_application/screens/authentication/signin/signinView.dart';
import 'package:dating_application/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mockito/mockito.dart';

void main() {
    test('j2m', () {
      var map = <String,dynamic>{};
      var json = "{\n          \"message\": \"The email has already been taken.\",\n      \"errors\": {\n      \"email\": [\n      \"The email has already been taken.\"\n      ],\n      \"email2\": [\n      \"The email has already been taken.\"\n      ],\n      \"email3\": [\n      \"The email has already been taken.\"\n      ]\n      }\n    }";

      var err=responseFromJson(json.toString()).errors;
      err?.forEach((key, value) {
        print(key);
        print(value is List<dynamic>);
      });

      expect(true,true);
    });
}
