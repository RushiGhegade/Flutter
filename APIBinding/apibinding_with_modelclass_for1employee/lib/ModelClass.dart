class ModelClass {
  int? empid;
  String? empName;
  int? empSal;
  int? empAge;
  String? empImage;

  ModelClass(var data) {
    empid = data['id'];
    empName = data['employee_name'];
    empSal = data['employee_salary'];
    empAge = data['employee_age'];
    empImage = data['profile_image'];
  }
}
