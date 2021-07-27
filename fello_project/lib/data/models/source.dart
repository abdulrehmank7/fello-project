/// id : "techcrunch"
/// name : "TechCrunch"

class Source {
  String? _id;
  String? _name;

  String? get id => _id;

  String? get name => _name;

  Source({String? id, String? name}) {
    _id = id;
    _name = name;
  }

  Source.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }
}
