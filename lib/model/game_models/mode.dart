class ModeModel {
  final int id;
  final String name;

  ModeModel(this.id, this.name);

  ModeModel.fromJson(Map<String, dynamic> json)
      : id = json["checksum"],
        name = json["name"];
}
