class Entity {
  String _name;
  String _type;
  String _description;

  Entity({String name, String type, String description}) {
    this._name = name;
    this._type = type;
    this._description = description;
  }

  String get name => _name;
  String get type => _type;
  String get description => _description;

  Entity.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _type = json['type'];
    _description = json['description'];
  }
}
