import 'dart:math';

import 'package:faker/faker.dart';

class FakerData {
  ModelClass getFakeData() {
    Faker faker = Faker();
    final random = Random();

    int num1 = faker.randomGenerator.integer(9999, min: 1000);
    int num2 = faker.randomGenerator.integer(9999, min: 1000);

    int num3 = faker.randomGenerator.integer(9999, min: 1000);

    int num4 = faker.randomGenerator.integer(9999, min: 1000);

    int month = faker.randomGenerator.integer(12, min: 1);

    int year = DateTime.now().year + random.nextInt(5) + 1;

    String formattedExpiry =
        "${month.toString().padLeft(2, '0')}/${year % 100}";

    int ccv = faker.randomGenerator.integer(999, min: 100);

    return ModelClass(
        num1: num1,
        num2: num2,
        num3: num3,
        num4: num4,
        expiry: formattedExpiry,
        ccv: ccv);
  }
}

class ModelClass {
  int num1;
  int num2;
  int num3;
  int num4;
  String expiry;
  int ccv;

  ModelClass(
      {required this.num1,
      required this.num2,
      required this.num3,
      required this.num4,
      required this.expiry,
      required this.ccv});
}
