class Message {
  String? msg;
  String? read;
  String? told;
  String? type;
  String? sent;
  String? fromid;

  Message(
      {required this.msg,
      required this.read,
      required this.told,
      required this.type,
      required this.sent,
      required this.fromid});

  Message.fromJson(Map<String, dynamic> json) {
    msg = json['msg'].toString();
    read = json['read'].toString();
    told = json['told'].toString();
    type = json['type'].toString();
    sent = json['sent'].toString();
    fromid = json['fromid'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['read'] = this.read;
    data['told'] = this.told;
    data['type'] = this.type;
    data['sent'] = this.sent;
    data['fromid'] = this.fromid;
    return data;
  }
}
