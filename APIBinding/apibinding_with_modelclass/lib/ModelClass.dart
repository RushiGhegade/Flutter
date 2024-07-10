class ModelClass {
  String? status;
  List<Data>? data;
  String? message;

  ModelClass(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    data = [];

    if (json['data'] != null) {
      json['data'].forEach((obj) {
        Data newobj = Data(obj);
        data!.add(newobj);
      });
    }
  }
}

class Data {
  int? id;
  String? empName;
  int? empSal;
  int? empAge;
  String? empProfileImage;

  Data(Map<String, dynamic> obj){
    id=obj['id'];
    empName=obj['employee_name'];
    empSal=obj['employee_salary'];
    empAge=obj['employee_age'];
    empProfileImage=obj['profile_image'];
  }
}
