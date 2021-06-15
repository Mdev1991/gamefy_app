class KeywordModel {
  final int id;
  final String name;

  KeywordModel(this.id, this.name);

  KeywordModel.fromJson(Map<String, dynamic> json)
      : id = json["checksum"],
        name = json["name"];
}
