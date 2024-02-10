class User {
  int? id;
  String? name;
  String? facebook;
  String? email;
  String? snapchat;
  String? instagram;
  String? twitter;
  String? whatsapp;
  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['instagram'] = instagram!;
    mapping['snapchat'] = snapchat!;
    mapping['whatsapp'] = whatsapp!;
    mapping['facebook'] = facebook!;
    mapping['twitter'] = twitter!;
    mapping['email'] = email!;

    return mapping;
  }
}
