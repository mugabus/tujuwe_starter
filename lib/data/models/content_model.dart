class ContentModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String type;

  ContentModel({required this.id, required this.title, required this.description, required this.image, required this.type});

  factory ContentModel.fromMap(Map<String,dynamic> m) => ContentModel(
    id: m['id']??0, title: m['title']??'', description: m['description']??'', image: m['image']??'', type: m['type']??''
  );
}
