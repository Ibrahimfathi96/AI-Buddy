class ModelsModel {
  final String id;
  final String root;
  final int created;
  ModelsModel({
    required this.created,
    required this.id,
    required this.root,
  });

  factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
        created: json['created'],
        id: json['id'],
        root: json['root'],
      );

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}
