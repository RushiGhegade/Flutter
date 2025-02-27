class CourceDataModel {
  int? courceId;
  String? courceName;
  String? image;
  List<String>? courceEnrol;
  List<String>? courcePurchesBy;
  List<String>? courceLecture;
  List<String>? courcePDF;

  CourceDataModel(
      {this.courceId,
      this.courceName,
      this.image,
      this.courceEnrol,
      this.courceLecture,
      this.courcePDF,
      this.courcePurchesBy});
}
