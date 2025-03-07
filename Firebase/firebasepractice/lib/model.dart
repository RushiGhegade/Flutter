import 'package:image_picker/image_picker.dart';

class Student {
  String name;
  String collage;
  String cgpa;
  XFile? file;

  Student({
    required this.name,
    required this.collage,
    required this.cgpa,
    required this.file,
  });
}
