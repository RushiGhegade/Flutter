import 'package:firebasepractice/model.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  Rx<Student> student =
      Student(name: "Rushikesh", collage: "Zeal", cgpa: "9.10", file: null).obs;

  void changeData(Student data) {
    student.update((obj) {
      obj!.name = data.name;
      obj.collage = data.collage;
      obj.cgpa = data.cgpa;
      obj.file = data.file;
    });
  }
}
